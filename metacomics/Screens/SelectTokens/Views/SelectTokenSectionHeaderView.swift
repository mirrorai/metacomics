import UIKit

class SelectTokenSectionHeaderView: UICollectionReusableView {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var numberBackgroundView: UIView!
    
    
    // MARK: - private properties

    // MARK: - life cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
        titleLabel.text = nil
        numberLabel.isHidden = true
        numberBackgroundView.isHidden = true
    }

    // MARK: - configs

    func config(
        title: String?,
        number: String?
    ) {
        titleLabel.text = title
        if let number = number {
            numberLabel.text = number
            numberLabel.isHidden = false
            numberBackgroundView.isHidden = false
        } else {
            numberLabel.text = nil
            numberLabel.isHidden = true
            numberBackgroundView.isHidden = true
        }
    }

}
