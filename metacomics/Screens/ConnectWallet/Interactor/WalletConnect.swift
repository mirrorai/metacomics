//
//  Copyright © 2019 Gnosis Ltd. All rights reserved.
//

import Foundation
import WalletConnectSwift
import UIKit

protocol WalletConnectDelegate {
    func failedToConnect()
    func didConnect()
    func didDisconnect()
}

class WalletConnect {
    var client: Client!
    var session: Session!
    var delegate: WalletConnectDelegate

    let sessionKey = "sessionKey"

    init(delegate: WalletConnectDelegate) {
        self.delegate = delegate
    }

    func connect() -> String {
        // gnosis wc bridge: https://safe-walletconnect.gnosis.io/
        // test bridge with latest protocol version: https://bridge.walletconnect.org
        let wcUrl =  WCURL(topic: UUID().uuidString,
                           bridgeURL: URL(string: "https://bridge.walletconnect.org")!,
                           key: try! randomKey())
        let clientMeta = Session.ClientMeta(name: "MirrorAI",
                                            description: "Mirror",
                                            icons: [],
                                            url: URL(string: "https://mirror-ai.com")!)
        let dAppInfo = Session.DAppInfo(peerId: UUID().uuidString, peerMeta: clientMeta)
        client = Client(delegate: self, dAppInfo: dAppInfo)

        print("WalletConnect URL: \(wcUrl.absoluteString)")

        try? client.connect(to: wcUrl)
        return wcUrl.absoluteString
    }
    
    func sign(message: String, completion: @escaping (Swift.Result<String, Error>) -> Void) {
        do {
            try client.personal_sign(
                url: session.url,
                message: message,
                account: session.walletInfo!.accounts[0]
            ) { response in
                // handle the response from Wallet here
                if let error = response.error {
                    print("Sign error: \(error)")
                    completion(.failure(error))
                    return
                }
                do {
                    let key = try response.result(as: String.self) // response.url.key
                    print("Sign key: \(key)")
                    completion(.success(key))
                } catch {
                    print("Sign error: \(error)")
                    completion(.failure(error))
                }
            }
        } catch {
            print("Sign error: \(error)")
            completion(.failure(error))
        }
    }

    func reconnectIfNeeded() {
        if let oldSessionObject = UserDefaults.standard.object(forKey: sessionKey) as? Data,
            let session = try? JSONDecoder().decode(Session.self, from: oldSessionObject) {
            client = Client(delegate: self, dAppInfo: session.dAppInfo)
            try? client.reconnect(to: session)
        }
    }

    // https://developer.apple.com/documentation/security/1399291-secrandomcopybytes
    private func randomKey() throws -> String {
        var bytes = [Int8](repeating: 0, count: 32)
        let status = SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)
        if status == errSecSuccess {
            return Data(bytes: bytes, count: 32).toHexString()
        } else {
            // we don't care in the example app
            enum TestError: Error {
                case unknown
            }
            throw TestError.unknown
        }
    }
    
    func openWallet() {
        let wcUrl =  WCURL(topic: UUID().uuidString,
                           bridgeURL: URL(string: "https://bridge.walletconnect.org")!,
                           key: try! randomKey())
        guard let url = URL(string: wcUrl.absoluteString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(
                url, options: [:],
                completionHandler: nil
            )
        }
    }
}

extension WalletConnect: ClientDelegate {
    func client(_ client: Client, didFailToConnect url: WCURL) {
        delegate.failedToConnect()
    }

    func client(_ client: Client, didConnect url: WCURL) {
        // do nothing
    }

    func client(_ client: Client, didConnect session: Session) {
        self.session = session
        let sessionData = try! JSONEncoder().encode(session)
        UserDefaults.standard.set(sessionData, forKey: sessionKey)
        delegate.didConnect()
    }

    func client(_ client: Client, didDisconnect session: Session) {
        UserDefaults.standard.removeObject(forKey: sessionKey)
        delegate.didDisconnect()
    }

    func client(_ client: Client, didUpdate session: Session) {
        // do nothing
    }
}
