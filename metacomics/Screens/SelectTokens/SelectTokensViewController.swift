import Combine
import UIKit
import web3swift

class SelectTokensViewController: UIViewController {
    
    // MARK: - outlets
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    // MARK: - private properties
    
    private var cancellable: AnyCancellable?

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.stopAnimating()
    }
    
    private func next() {

    }
    
    // MARK: - Actions

}
