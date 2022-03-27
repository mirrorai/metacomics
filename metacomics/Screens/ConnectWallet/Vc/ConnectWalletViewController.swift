import Combine
import UIKit

class ConnectWalletViewController: UIViewController {
    
    // MARK: - outlets
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var connectWalletButton: UIButton!
    @IBOutlet private var statusLabel: UILabel!
    
    // MARK: - private properties
    
    private var interactor: ConnectWalletInteractor = ConnectWalletInteractor()
    private var cancellable: AnyCancellable?
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusLabel.text = nil
        activityIndicator.stopAnimating()
        
        cancellable = interactor.walletConnectionSubject.receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.next()
                case let .failure(error):
                    self.connectWalletButton.isEnabled = true
                    self.showAlert("🧦 Error", message: error.localizedDescription)
                }
            } receiveValue: { [weak self] walletId in
                guard let self = self else { return }
                //                self.showAlert("💵 Wallet ID", message: walletId)
            }
    }
    
    private func next() {
        connectWalletButton.isEnabled = false
        statusLabel.text = "🦆 Connected"
        activityIndicator.stopAnimating()
        
        //        interactor.sign(message: "aaaa")
        
        // CLEAN UP ACCESS TOKEN
        let key = UserDefaults.DefaultsKeys.authenticateAccessToken.rawValue
        UserDefaults.standard.set(nil, forKey: key)
        
        interactor.login() { _ in
            self.interactor.getProfiles { result in
                print("=== GET_PROFILES ===")
                guard let profiles = try? result.get() else { return }
                print("PROFILES COUNT = \(profiles.count)")
                
                guard let profile = profiles.first else { return }
                print("PROFILE ID = \(profile.id)")
                
                self.interactor.getFollowers(profileId: profile.id) { result in
                    print("=== FOLLOWERS ===")
                    guard let value = try? result.get() else { return }
                    print("FOLLOWERS COUNT = \(value.count)")
                }
                
                self.interactor.getFollowing() { result in
                    print("=== FOLLOWINGS ===")
                    guard let value = try? result.get() else { return }
                    print("FOLLOWINGS COUNT = \(value.count)")
                }
                
                
//                guard let profileToFollow = profiles.last else { return }
//                print("PROFILE_TO_FOLLOW ID = \(profileToFollow.id)")
//
//                self.interactor.follow(profileId: profileToFollow.id) { result in
//                    print("=== FOLLOW ===")
//                    print(result)
//                }
            }
            
            //            self.interactor.addProfile(username: "testuser4") { result in
            //                guard let value = try? result.get() else { return }
            //            }
            
            
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func connect() {
        activityIndicator.startAnimating()
        connectWalletButton.isEnabled = false
        //        interactor.connectWallet(
        //            onSuccess: { [weak self] walletId in
        //                guard let self = self else { return }
        //                self.next()
        //            },
        //            onError: { [weak self] in
        //                guard let self = self else { return }
        //                self.connectWalletButton.isEnabled = true
        //                self.showAlert("🧦 Error", message: "Please try again!")
        //            }
        //        )
        interactor.connectWalletWithPublisher()
    }
    
}
