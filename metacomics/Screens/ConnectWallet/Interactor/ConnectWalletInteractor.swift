import Combine
import UIKit
import WalletConnectSwift

class ConnectWalletInteractor {
    
    enum Error: Swift.Error {
        case connectionError
    }
    
    let walletConnectionSubject = PassthroughSubject<String, Error>()
    
    private var walletConnect: WalletConnect!
    private var walletId: String?
    
    private var connectClosure: StringClosure?
    private var errorClosure: EmptyClosure?
    
    init() {
        walletConnect = WalletConnect(delegate: self)
        walletConnect.reconnectIfNeeded()
//        walletId = "0x58Ae6515A2d8464cbDb3d68ff3a5B1B4c774e9e2"
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
    
}

extension ConnectWalletInteractor: WalletConnectDelegate {
    
    func failedToConnect() {
        onMainThread { [unowned self] in
            self.errorClosure?()
            self.walletConnectionSubject.send(completion: .failure(.connectionError))
        }
        
    }

    func didConnect() {
        if let wallet = walletConnect.session.walletInfo?.accounts.first {
            walletId = wallet
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
