import Combine
import UIKit
import web3swift

class SelectTokensViewController: UIViewController {
    
    // MARK: - outlets
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var nextButton: UIButton!

    // MARK: - private properties
    
    private var cancellable: AnyCancellable?
    private lazy var collectionViewCollegue = SelectTokenViewControllerCollegue()
    
    private var sections: [CollectionViewSection<TokenInfo>] = []
    
    var profile: ProfileItemInfo? = ProfileItemInfo.stubProfile
    var friends: [ProfileItemInfo] = ProfileItemInfo.stubFiendProfiles
    private var wallet: String? {
        return profile?.ownedBy
    }
    
    private var selectedTokens: [TokenInfo] = []

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Select NFTs"
        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = createWalletButton()
        configCollectionView()
        configCollectionViewCollegue()
        activityIndicator.stopAnimating()
        setNextButtonEnabled(false)
        laodTokens()
        
    }
    
    private func configCollectionView() {
        collectionView.delegate = collectionViewCollegue
        collectionView.dataSource = collectionViewCollegue
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        
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
        collectionViewCollegue.selectedTokens = { [weak self] tokens in
            guard let self = self else { return }
            self.selectedTokens = tokens
            self.setNextButtonEnabled(tokens.count >= 3)
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
                    CollectionViewSection<TokenInfo>(title: nil, number: nil, items: items)
                ]
                DispatchQueue.main.async {
                    self.reloadCollectionView()
                }
                guard let friendId = self.friends.first?.ownedBy else { return }
                
                DispatchQueue.main.async {
                    self.activityIndicator.startAnimating()
                }
                GetTokensAPI().getTokens(walletId: friendId) { [weak self] result in
                    guard let self = self else { return }
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                    }
                    switch result {
                    case let .success(friendItems):
                        self.sections = [
                            CollectionViewSection<TokenInfo>(title: nil, number: nil, items: items),
                            CollectionViewSection<TokenInfo>(title: "Friends", number: 1, items: friendItems)
                        ]
                        DispatchQueue.main.async {
                            self.reloadCollectionView()
                        }
                    case let .failure(error):
                        break
                    }
                
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
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
    
    private func setNextButtonEnabled(_ enabled: Bool) {
        nextButton.isEnabled = enabled
        nextButton.backgroundColor = enabled ?
            UIColor(red: 96.0/255.0, green: 38.0/255, blue: 1, alpha: 1) :
            UIColor.systemGray5
        
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTapped() {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ConstructorViewController")
                as? ConstructorViewController
        else { return }
        vc.profile = self.profile
        vc.tokens = self.selectedTokens
        self.navigationController?.pushViewController(vc, animated: true)    }

}
