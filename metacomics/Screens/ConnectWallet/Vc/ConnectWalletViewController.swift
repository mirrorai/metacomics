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
                self.showAlert("💵 Wallet ID", message: walletId)
            }
    }
    
    private func next() {
        connectWalletButton.isEnabled = false
        statusLabel.text = "🦆 Connected"
        activityIndicator.stopAnimating()
        
        interactor.sign(message: "aaaa")
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
