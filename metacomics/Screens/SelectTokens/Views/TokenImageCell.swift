//import PINRemoteImage
import UIKit

final class TokenImageCell: UICollectionViewCell {

    // MARK: - properties

    var indexPath: IndexPath?
    var image: UIImage? {
        return imageView.image
    }

    // MARK: - private outlets

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private var imageViewContainerView: UIView!
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var numberBackgroundView: UIView!

    // MARK: - properties

    // MARK: - life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        startSpinner()
        nameLabel.text = nil
        subtitleLabel.text = nil
        cleanImageView()
        imageViewContainerView.layer.borderWidth = 0 // 2
        imageViewContainerView.layer.borderColor = UIColor(red: 96.0/255.0, green: 38.0/255, blue: 1, alpha: 1).cgColor
        imageViewContainerView.layer.cornerRadius = 3
        
        numberLabel.isHidden = true
        numberBackgroundView.isHidden = true
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        startSpinner()
        nameLabel.text = nil
        subtitleLabel.text = nil
        cleanImageView()
    }

    func cleanImageView() {
        imageView.layer.removeAllAnimations()
//        imageView.cancelImageDownload()
        imageView.image = nil
    }

    // MARK: - configs

    func config(image: UIImage?) {
        imageView.image = image
        stopSpinner()
    }
    
    func config(with title: String?, subtitle: String?) {
        nameLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    func config(isSelected: Bool, number: Int?) {
        if isSelected {
            imageViewContainerView.layer.borderWidth = 2
//            numberLabel.isHidden = false
//            numberBackgroundView.isHidden = false
//            if let number = number {
//                numberLabel.text = "\(number)"
//            } else {
//                numberLabel.text = nil
//            }
        } else {
            imageViewContainerView.layer.borderWidth = 0
//            numberLabel.isHidden = true
//            numberBackgroundView.isHidden = true
//            numberLabel.text = nil
        }
    }

    // MARK: - animation handler

    // MARK: - activity indicator

    private func startSpinner() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    private func stopSpinner() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}
