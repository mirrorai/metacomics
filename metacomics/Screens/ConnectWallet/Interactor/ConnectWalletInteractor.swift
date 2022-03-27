import Apollo
import Combine
import UIKit
import WalletConnectSwift
import web3swift
import BigInt

class ConnectWalletInteractor {
    
    enum Error: Swift.Error {
        case connectionError
        case authError
        case generateChallengeError
        case getProfilesError
        case invalidUsername
        case textError(description: String)
        case followError
        case getFollowersError
        case getFollowingError
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
            self.walletConnect.openWallet()
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
                    completion(.failure(.getFollowersError))
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
                completion(.failure(.getFollowersError))
            }
        }
    }
    
    func getFollowing(completion: @escaping (Swift.Result<[ProfileItemInfo], Error>) -> Void) {
        guard let wallet = walletAddress else { return }
        let request = FollowingRequest(limit: nil, cursor: nil, address: wallet)
        let query = GetFollowingQuery(request: request)
        ApolloNetwork.shared.client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                guard let items = graphQLResult.data?.following.items else { return }
                let json = items.map { $0.resultMap }
                do {
                    let data = try JSONSerialization.data(withJSONObject: json, options: [])
                    let profiles = try JSONDecoder().decode([ProfileItemInfo].self, from: data )
                    self.onMainThread {
                        completion(.success(profiles))
                    }
                } catch {
                    print("Failure! Error: \(error)")
                    completion(.failure(.getFollowingError))
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
                completion(.failure(.getFollowingError))
            }
        }
    }

    func cleanJson(json: JSONObject) -> JSONObject {
        var result = json
        result.removeValue(forKey: "__typename")
        for (k, v) in result {
            if let v = v as? JSONObject {
                result[k] = cleanJson(json: v)
            } else if let v = v as? Array<JSONObject> {
                var newV: Array<JSONObject> = []
                v.forEach { jsonObject in
                    newV.append(cleanJson(json: jsonObject))
                }
                result[k] = newV
            }
        }
        return result
    }

    func follow(profileId: String, completion: @escaping (Swift.Result<String, Error>) -> Void) {
        let request = FollowRequest(follow: [Follow(profile: profileId)])
        let mutation = FollowMutation(request: request)
        ApolloNetwork.shared.client.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")

                guard var data = graphQLResult.data?.createFollowTypedData.typedData else {
                    completion(.failure(.followError))
                    return
                }

                ///*
                print("=== DATA === ")
                print(data)

                let json = self.cleanJson(json: data.jsonObject)

                print("=== CLEAN DATA ===")
                print(json)

                guard let data = try? JSONSerialization.data(withJSONObject: json, options: [.withoutEscapingSlashes]) else {
                      return
                }

                let message = String(data: data, encoding: String.Encoding.utf8) ?? ""

                let prettyMessage = data.prettyPrintedJSONString!
                
                let types: [ABI.Element.ParameterType] = [.uint(bits: 256)]
                let values: [AnyObject] = [27 as AnyObject]
                if let encodeResult = ABIEncoder.encodeSingleType(type: .array(type: .uint(bits: 256), length: 1), value: [BigUInt(27)] as AnyObject),//ABIEncoder.encode(types: types, values: values),
                   let kdata = Web3.Utils.keccak256(encodeResult) {
                    
                    let encodeResultString = kdata.toHexString()//String(data: kdata, encoding: .utf8)
                    print("=== encodeResultString ===")
                    print(encodeResultString)
                    //0x3ad8aa4f87544323a9d1e5dd902f40c356527a7955687113db5f9a85ad579dc1
                    
                    print("=== keccak256(0)  ===")
                    print(Web3.Utils.keccak256(Data()))
                }

                //*/

                guard let walletConnect = self.walletConnect else {
                    completion(.failure(.followError))
                    return
                }
                
                


                // TODO: pass correctly formatted message var into message param
                // STUBS:
                // Stub.lensTypedData - hardcoded message from graphql, *not working*
                // Stub.exampleTypedData - hardcoded message from example project, *working*
                let signature = try? self.walletConnect.client.eth_signTypedData(
                    url: walletConnect.session.url,
                    account: walletConnect.session.walletInfo!.accounts[0],
                    message: message) // Stub.exampleTypedData / Stub.lensTypedData
                { [weak self] response in
                    do {
                        let key = try response.result(as: String.self) // response.url.key
                        print("Sign key: \(key)")
                        completion(.success(key))
                    } catch {
                        print("Sign error: \(error)")
                        completion(.failure(.followError))
                    }
                    
                    self?.onMainThread {
                        completion(.success(response.url.key))
                    }
                }

                self.walletConnect.openWallet()

            case .failure(let error):
                print("Failure! Error: \(error)")
                completion(.failure(.followError))
                if case let .invalidResponseCode(response, rawData) = (error as! Apollo.ResponseCodeInterceptor.ResponseCodeError), let data = rawData {
                        print(String(data: data, encoding: .utf8))
                }
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


extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}




fileprivate enum Stub {
    /// https://docs.walletconnect.org/json-rpc-api-methods/ethereum#example-parameters
    static let exampleTypedData = """
{
    "types": {
        "EIP712Domain": [
            {
                "name": "name",
                "type": "string"
            },
            {
                "name": "version",
                "type": "string"
            },
            {
                "name": "chainId",
                "type": "uint256"
            },
            {
                "name": "verifyingContract",
                "type": "address"
            }
        ],
        "Mail": [
            {
                "name": "contents",
                "type": "string"
            }
        ]
    },
    "primaryType": "Mail",
    "domain": {
        "name": "Ether Mail",
        "version": "1",
        "chainId": 80001,
        "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC"
    },
    "message": {
        "contents": "Hello, Bob!"
    }
}
"""


    static let lensTypedData = """
{
    "types": {
        "FollowWithSig": [
            {
                "name": "contents",
                "type": "string"
            },
            {
                "name": "nonce",
                "type": "uint256"
            },
            {
                "name": "deadline",
                "type": "uint256"
            }
        ]
    },
    "primaryType": "FollowWithSig",
    "domain" : {
        "chainId" : 80001,
        "name" : "Lens Protocol Profiles",
        "verifyingContract" : "0xd7B3481De00995046C7850bCe9a5196B7605c367",
        "version" : "1"
    },
    "message" : {
        "contents": "Hello, Bob!",
        "nonce" : 1,
        "deadline" : 1658307789
    }
}
"""

    /*
     domain: {
       name: 'Lens Protocol Profiles',
       chainId: 80001,
       version: '1',
       verifyingContract: '0xd7B3481De00995046C7850bCe9a5196B7605c367',
       __typename: 'EIP712TypedDataDomain'
     },
     types: {
       FollowWithSig: [ [Object], [Object], [Object], [Object] ],
       __typename: 'CreateFollowEIP712TypedDataTypes'
     },
     value: {
       nonce: 2,
       deadline: 1648301554,
       profileIds: [ '0x01b6' ],
       datas: [ '0x' ],
       __typename: 'CreateFollowEIP712TypedDataValue'
     },
     __typename: 'CreateFollowEIP712TypedData'
   }
     */
}
