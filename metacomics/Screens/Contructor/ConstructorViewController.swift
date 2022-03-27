import Combine
import UIKit
import web3swift
import SwiftyGif

struct Components {
    let gifName: String
    let backgroundName: String
}

class ConstructorViewController: UIViewController {
    
    // MARK: - outlets
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
//    @IBOutlet private var nextButton: UIButton!
    @IBOutlet private var backgroundImageView: UIImageView!
    @IBOutlet private var imageView: UIImageView!

    // MARK: - private properties
    
    private var cancellable: AnyCancellable?

    var tokens: [TokenInfo] = []
    
    var components: Components? = Components(gifName: "box1.gif", backgroundName: "bg0")
    
    var profile: ProfileItemInfo? = ProfileItemInfo.stubProfile
    private var wallet: String? {
        return profile?.ownedBy
    }

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = ""
        navigationItem.rightBarButtonItem = createWalletButton()
        activityIndicator.stopAnimating()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = UIColor.black
        
        if let components = components {
            backgroundImageView.image = UIImage(named: components.backgroundName)
            do {
                let gif = try UIImage(gifName: components.gifName)
                imageView.setGifImage(gif, loopCount: -1)
            } catch {
                print(error)
            }
        }
    }
    
    private func createWalletButton() -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "profile_icon"), for: .normal)
        button.setTitle(wallet, for: .normal)
        button.backgroundColor = .black
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
    
    // MARK: - Actions
    
    @IBAction func nextButtonTapped() {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "PreviewViewController")
                as? PreviewViewController
        else { return }
        vc.profile = self.profile
        vc.tokens = self.tokens
        vc.components = self.components
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addStickerButtonTapped() {
        
    }

}
