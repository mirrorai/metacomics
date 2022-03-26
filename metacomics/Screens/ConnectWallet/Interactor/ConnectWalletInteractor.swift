import Apollo
import Combine
import UIKit
import WalletConnectSwift

class ConnectWalletInteractor {
    
    enum Error: Swift.Error {
        case connectionError
        case authError
        case generateChallengeError
        case getProfilesError
        case invalidUsername
        case textError(description: String)
    }
    
    let walletConnectionSubject = PassthroughSubject<String, Error>()
    
    private var walletConnect: WalletConnect!
    private var walletAddress: String? {
        return walletConnect.session.walletInfo?.accounts.first
    }
    
    private var connectClosure: StringClosure?
    private var errorClosure: EmptyClosure?
    
    init() {
        walletConnect = WalletConnect(delegate: self)
        walletConnect.reconnectIfNeeded()
    }
    
    func onMainThread(_ closure: @escaping () -> Void) {
        if Thread.isMainThread {
            closure()
        } else {
            DispatchQueue.main.async {
                closure()
            }
        }
    }
    
    func connectWallet(onSuccess: @escaping StringClosure, onError: @escaping EmptyClosure) {
        connectClosure = onSuccess
        errorClosure = onError
        
        let connectionUrl = walletConnect.connect()

        /// https://docs.walletconnect.org/mobile-linking#for-ios
        /// **NOTE**: Majority of wallets support universal links that you should normally use in production application
        /// Here deep link provided for integration with server test app only
        let deepLinkUrl = "wc://wc?uri=\(connectionUrl)"

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let url = URL(string: deepLinkUrl), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func connectWalletWithPublisher() {
        let connectionUrl = walletConnect.connect()

        /// https://docs.walletconnect.org/mobile-linking#for-ios
        /// **NOTE**: Majority of wallets support universal links that you should normally use in production application
        /// Here deep link provided for integration with server test app only
        let deepLinkUrl = "wc://wc?uri=\(connectionUrl)"

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let url = URL(string: deepLinkUrl), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func sign(message: String) {
//        print("sign")
//        walletConnect.sign(message: message)
    }
    
    func login(completion: @escaping (Swift.Result<String, Error>) -> Void) {
        guard let wallet = walletAddress else { return }
        let key = UserDefaults.DefaultsKeys.authenticateAccessToken.rawValue
        if let token = UserDefaults.standard.string(forKey: key) {
            completion(.success(token))
            return
        }
        generateChallenge(address: wallet) { [weak self] result in
            guard let self = self else { return }
            guard let text = try? result.get() else { return }
            self.walletConnect.sign(message: text) { signResult in
                guard let key = try? signResult.get() else { return }
                self.authenticate(address: wallet, signature: key) { authResult in
                    guard let accessToken = try? authResult.get() else { return }
                    let key = UserDefaults.DefaultsKeys.authenticateAccessToken.rawValue
                    UserDefaults.standard.set(accessToken, forKey: key)
                    completion(.success(""))
                }
            }
        }
        
    }
    
    private func authenticate(address: String, signature: String, completion: @escaping (Swift.Result<String, Error>) -> Void) {
        
        let request = SignedAuthChallenge(address: address, signature: signature)
        let mutation = AuthenticateMutation(request: request)
        ApolloNetwork.shared.client.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                guard let accessToken = graphQLResult.data?.authenticate.accessToken else { return }
                print(accessToken)
                self.onMainThread {
                    completion(.success(accessToken))
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
                completion(.failure(.authError))
//                if case let .invalidResponseCode(response, rawData) = (error as! Apollo.ResponseCodeInterceptor.ResponseCodeError), let data = rawData {
//                    print(String(data: data, encoding: .utf8))
//                }
            }
        }
    }
    
    private func signText(_ text: String) {
        
    }
    
    private func generateChallenge(address: String, completion: @escaping (Swift.Result<String, Error>) -> Void) {
        let request = ChallengeRequest(address: address)
        let query = GenerateChallengeQuery(request: request)
        ApolloNetwork.shared.client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                guard let text = graphQLResult.data?.challenge.text else { return }
                print(text)
                self.onMainThread {
                    completion(.success(text))
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
                completion(.failure(.generateChallengeError))
            }
        }
    }
    
    func getProfiles(completion: @escaping (Swift.Result<[ProfileItemInfo], Error>) -> Void) {
        guard let wallet = walletAddress else { return }
        let request = ProfileQueryRequest(
            limit: nil,
            cursor: nil,
            profileIds: nil,
            ownedBy: [wallet],
            handles: nil,
            whoMirroredPublicationId: nil
        )
        let query = GetProfilesQuery(request: request)
        ApolloNetwork.shared.client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                guard let items = graphQLResult.data?.profiles.items else { return }
                let json = items.map { $0.resultMap }
                do {
                    let data = try JSONSerialization.data(withJSONObject: json, options: [])
                    let profiles = try JSONDecoder().decode([ProfileItemInfo].self, from: data )
                    self.onMainThread {
                        completion(.success(profiles))
                    }
                } catch {
                    print("Failure! Error: \(error)")
                    completion(.failure(.getProfilesError))
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
                completion(.failure(.getProfilesError))
            }
        }
    }
    
    func addProfile(username: String, completion: @escaping (Swift.Result<String, Error>) -> Void) {
        guard
            !username.isEmpty,
            username.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil,
            username.lowercased() == username
        else {
            completion(.failure(.invalidUsername))
            return
        }
        guard let wallet = walletAddress else { return }
        login { result in
            guard let token = try? result.get() else { return }
            self.createProfile(username: username, addres: wallet) { result in
                guard let txHash = try? result.get() else { return }
                self.hasTxBeenIndexed(txHash: txHash) { hasTxBeenIndexedResult in
                    guard let value = try? hasTxBeenIndexedResult.get() else { return }
                }
            }
            
        }
    }
    
    func createProfile(username: String, addres: String, completion: @escaping (Swift.Result<String, Error>) -> Void) {
        let request = CreateProfileRequest(
            handle: username,
            profilePictureUri: nil,
            followModule: nil,
            followNfturi: nil
        )
        let mutation = CreateProfileMutation(request: request)
        ApolloNetwork.shared.client.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                guard let txHash = graphQLResult.data?.createProfile.asRelayerResult?.txHash else { return }
                print(txHash)
                self.onMainThread {
                    completion(.success(txHash))
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
                completion(.failure(.authError))
                if case let .invalidResponseCode(response, rawData) = (error as! Apollo.ResponseCodeInterceptor.ResponseCodeError), let data = rawData {
                        print(String(data: data, encoding: .utf8))
                }
            }
        }
    }
    
    private func hasTxBeenIndexed(txHash: String, completion: @escaping (Swift.Result<String, Error>) -> Void) {
        let request = HasTxHashBeenIndexedRequest(txHash: txHash)
        let query = HasTxHashBeenIndexedQuery(request: request)
        ApolloNetwork.shared.client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                guard
                    let data = graphQLResult.data,
                    let hasTxHashBeenIndexed = graphQLResult.data?.hasTxHashBeenIndexed,
                    hasTxHashBeenIndexed.__typename == "TransactionIndexedResult"
                else { return }
                print(hasTxHashBeenIndexed)
                
                let topicId = "ProfileCreated(uint256,address,address,string,string,address,bytes,string,uint256)"
                if let metadataStatus = hasTxHashBeenIndexed.asTransactionIndexedResult?.metadataStatus {
                    if metadataStatus.status == .success {
                        let profileCreatedLog = hasTxHashBeenIndexed
                            .asTransactionIndexedResult?
                            .txReceipt?
                            .logs
                            .first { $0.topics[0] == topicId }
                        profileCreatedLog?.topics[1]
                        self.onMainThread {
                            completion(.success("profileId"))
                        }
                        return
                    }
                    if metadataStatus.status == .metadataValidationFailed {
                        completion(.failure(.textError(description: metadataStatus.reason ?? "")))
                        return
                    }
                } else {
                    if hasTxHashBeenIndexed.asTransactionIndexedResult?.indexed == true {
                        let profileCreatedLog = hasTxHashBeenIndexed
                            .asTransactionIndexedResult?
                            .txReceipt?
                            .logs
                            .first { $0.topics[0] == topicId }
                        profileCreatedLog?.topics[1]
                        self.onMainThread {
                            completion(.success("profileId"))
                        }
                       return
                    }
                }
                DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                    self.hasTxBeenIndexed(txHash: txHash, completion: completion)
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
                completion(.failure(.getProfilesError))
            }
        }
    }
    
//    private func pollUntilIndexed(txHash: String, completion: @escaping (Swift.Result<Bool, Error>) -> Void) {
//        hasTxBeenIndexed(txHash: txHash, completion: <#T##(Result<Bool, Error>) -> Void#>)
//    }


    func getFollowers(profileId: String, completion: @escaping (Swift.Result<[ProfileItemInfo], Error>) -> Void) {
        guard let wallet = walletAddress else { return }
        let request = FollowersRequest(profileId: profileId)
        let query = GetFollowersQuery(request: request)
        ApolloNetwork.shared.client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                guard let items = graphQLResult.data?.followers.items else { return }
                let json = items.map { $0.resultMap }
                do {
                    let data = try JSONSerialization.data(withJSONObject: json, options: [])
                    let profiles = try JSONDecoder().decode([ProfileItemInfo].self, from: data )
                    self.onMainThread {
                        completion(.success(profiles))
                    }
                } catch {
                    print("Failure! Error: \(error)")
                    completion(.failure(.getProfilesError))
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
                completion(.failure(.getProfilesError))
            }
        }
    }
    
}

extension ConnectWalletInteractor: WalletConnectDelegate {
    
    func failedToConnect() {
        onMainThread { [unowned self] in
            self.errorClosure?()
            self.walletConnectionSubject.send(completion: .failure(.connectionError))
        }
        
    }

    func didConnect() {
        if let wallet = walletAddress {
            onMainThread { [unowned self] in
                self.connectClosure?(wallet)
                self.walletConnectionSubject.send(wallet)
                self.walletConnectionSubject.send(completion: .finished)
            }
        }
    }

    func didDisconnect() {
        
    }
}
