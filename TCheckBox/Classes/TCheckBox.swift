//
//  TCheckBox.swift
//  TCheckBox
//
//  Created by Nguyen, Thinh on 02/08/2022.
//

import Foundation

public final class TCheckBox: UIView {
    private static let bundle = Bundle(for: TCheckBox.self)
    
    private let uncheckImage = UIImage(named: "uncheck", in: bundle, compatibleWith: nil)
    private let checkImage = UIImage(named: "check", in: bundle, compatibleWith: nil)
    
    public let checkButton = UIButton()
    public let contentLabel = UILabel()
    
    var isEnable: Bool = true {
        didSet {
            setupEnable()
        }
    }
    
    public init() {
        super.init(frame: .zero)
        
        addSubviews()
        setupSubviews()
        setupLayout()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if super.hitTest(point, with: event) != nil {
            return checkButton
        }
        
        return nil
    }
}

// MARK: - Public Functions
extension TCheckBox {
    
}

// MARK: - Private Functions
extension TCheckBox {
    private func addSubviews() {
        addSubview(checkButton)
        addSubview(contentLabel)
    }
    
    private func setupSubviews() {
        /// checkButton
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.accessibilityIdentifier = "checkbox.button"
        checkButton.setImage(uncheckImage, for: .normal)
        checkButton.setImage(checkImage, for: .highlighted)
        checkButton.setImage(checkImage, for: .selected)
        
        /// contentLabel
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.font = UIFont.systemFont(ofSize: 16)
        contentLabel.textColor = UIColor(rgb: 0x333333)
        contentLabel.accessibilityIdentifier = "checkbox.content"
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            checkButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkButton.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            contentLabel.topAnchor.constraint(equalTo: topAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentLabel.firstBaselineAnchor.constraint(equalTo: checkButton.titleLabel!.firstBaselineAnchor)
        ])
        
        checkButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        contentLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    private func setupEnable() {
        if isEnable {
            checkButton.setImage(uncheckImage, for: .normal)
            contentLabel.textColor = UIColor(rgb: 0x333333)
        } else {
            let checkBoxTintColor = UIColor(rgb: 0xE6E6E6)
            checkButton.setImage(uncheckImage?.tinted(with: checkBoxTintColor), for: .normal)
            contentLabel.textColor = checkBoxTintColor
        }
    }
}

private extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

private extension UIImage {
    func tinted(with color: UIColor, isOpaque: Bool = false) -> UIImage? {
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            color.set()
            withRenderingMode(.alwaysTemplate).draw(at: .zero)
        }
    }
}
