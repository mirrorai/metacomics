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

    // MARK: - properties

    // MARK: - life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        startSpinner()
        nameLabel.text = nil
        subtitleLabel.text = nil
        cleanImageView()
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
