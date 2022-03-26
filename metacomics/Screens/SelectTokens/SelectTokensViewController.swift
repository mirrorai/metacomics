import Combine
import UIKit
import web3swift

class SelectTokensViewController: UIViewController {
    
    // MARK: - outlets
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var collectionView: UICollectionView!

    // MARK: - private properties
    
    private var cancellable: AnyCancellable?
    private lazy var collectionViewCollegue = SelectTokenViewControllerCollegue()
    
    private var sections: [CollectionViewSection<TokenInfo>] = []
    
    var wallet: String? = "0x58Ae6515A2d8464cbDb3d68ff3a5B1B4c774e9e2"

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Tokens"
        navigationItem.rightBarButtonItem = createWalletButton()
        configCollectionView()
        configCollectionViewCollegue()
        activityIndicator.stopAnimating()
        laodTokens()
        
    }
    
    private func configCollectionView() {
        collectionView.delegate = collectionViewCollegue
        collectionView.dataSource = collectionViewCollegue
        
        collectionView.register(
            UINib(nibName: "SelectTokenSectionHeaderView", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "SelectTokenSectionHeaderView"
        )
    }

    private func configCollectionViewCollegue() {
        collectionViewCollegue.sections = sections
        collectionViewCollegue.onCellSelected = { [weak self] token in
            guard let self = self else { return }
        }
    }
    
    private func laodTokens() {
        guard let wallet = wallet else {
            return
        }
        activityIndicator.startAnimating()
        GetTokensAPI().getTokens(walletId: wallet) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            switch result {
            case let .success(items):
                self.sections = [
                    CollectionViewSection<TokenInfo>(title: nil, number: nil, items: items),
                    CollectionViewSection<TokenInfo>(title: "Friends", number: 1, items: items)
                ]
                DispatchQueue.main.async {
                    self.reloadCollectionView()
                }
            case let .failure(error):
                break
            }
        
        }
        
    }
    
    private func reloadCollectionView() {
        collectionViewCollegue.sections = sections
        collectionView.reloadData()
    }
    
    private func createWalletButton() -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "profile_icon"), for: .normal)
        button.setTitle(wallet, for: .normal)
        button.backgroundColor = UIColor(red: 96.0/255.0, green: 38.0/255, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        button.frame = CGRect(x: 0, y: 0, width: 110, height: 28)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        let barButton = UIBarButtonItem(customView: button)
        let currentWidth = barButton.customView?.widthAnchor.constraint(equalToConstant: 110)
        currentWidth?.isActive = true
        let currentHeight = barButton.customView?.heightAnchor.constraint(equalToConstant: 28)
        currentHeight?.isActive = true
        return barButton
    }
    
    private func next() {

    }
    
    // MARK: - Actions

}
