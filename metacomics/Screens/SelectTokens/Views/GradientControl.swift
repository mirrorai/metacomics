import UIKit

@IBDesignable
final class GradientControl: UIControl {

    // MARK: - public properties

    @IBInspectable var startColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
        didSet {
            updateGradientLayer()
        }
    }

    @IBInspectable var endColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0) {
        didSet {
            updateGradientLayer()
        }
    }

    var colorsArray: [UIColor]?
    var colorsLocations: [NSNumber]? {
        didSet {
            precondition(colorsArray?.count == colorsLocations?.count, "colorsLocations is a pair for colorsArray")
        }
    }

    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0) {
        didSet {
            updateGradientLayer()
        }
    }

    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.0, y: 1.0) {
        didSet {
            updateGradientLayer()
        }
    }

    // MARK: - private properties

    private var colors: [CGColor] {
        if let colorsArray = colorsArray {
            return colorsArray.map { $0.cgColor }
        } else {
            return [startColor.cgColor, endColor.cgColor]
        }
    }

    // MARK: - GradientView life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        initialConfigure()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialConfigure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialConfigure()
    }

    // MARK: - configure

    private func initialConfigure() {
        updateGradientLayer()
    }

    // MARK: - gradient

    func updateGradientLayer() {
        guard let gradientLayer = self.layer as? CAGradientLayer else { return }
        gradientLayer.colors = colors
        gradientLayer.locations = colorsLocations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }

    // MARK: - override

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        updateGradientLayer()
    }

    // MARK: - interafce builder

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateGradientLayer()
    }

}
