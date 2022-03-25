import Apollo
import Combine
import UIKit
import WalletConnectSwift

class ConnectWalletInteractor {
    
    enum Error: Swift.Error {
        case connectionError
        case authError
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
//        walletConnect.sign(message: message)
    }
    
    func login() {
        guard let wallet = walletAddress else { return }
        generateChallenge(address: wallet) { [weak self] result in
            guard let self = self else { return }
            guard let text = try? result.get() else { return }
            self.walletConnect.sign(message: text) { signResult in
                guard let key = try? signResult.get() else { return }
                self.authenticate(address: wallet, signature: key) { authResult in
                    guard let accessToken = try? authResult.get() else { return }
                    let key = UserDefaults.DefaultsKeys.authenticateAccessToken.rawValue
                    UserDefaults.standard.set(accessToken, forKey: key)
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
                completion(.failure(error as! ConnectWalletInteractor.Error))
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
