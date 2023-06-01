//
//  CILabel.swift
//  CustomUIKitItems
//
//  Created by GonzaloMR on 1/6/23.
//

import UIKit

@IBDesignable
public class CILabel: UILabel {

    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable var roundedCorners: Bool = false {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable var gradientStartColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var gradientMidColor: UIColor? {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var gradientEndColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var gradientHorizontal: Bool = false {
        didSet {
            layoutSubviews()
        }
    }
    
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()

        // Border
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.masksToBounds = true

        // Corner radius
        if roundedCorners {
            layer.cornerRadius = frame.height / 2.0
        } else {
            layer.cornerRadius = cornerRadius
        }
        
        // Gradient
        let gradient = getGradientLayer()
        self.textColor = gradientColor(gradientLayer: gradient)
    }

    private func getGradientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()

        gradient.frame = self.bounds

        // If transparent colors, replaced with white transparent to avoid undesirable effects
        let startColor = gradientStartColor.isTransparent ? UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.0) : gradientStartColor
        let endColor = gradientEndColor.isTransparent ? UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.0) : gradientEndColor

        var colors: [CGColor] = [startColor.cgColor, endColor.cgColor]

        if let gradientMidColor = gradientMidColor {
            let midColor = gradientMidColor.isTransparent ? UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.0) : gradientMidColor
            colors.insert(midColor.cgColor, at: 1)
        }

        gradient.colors = colors

        let startPoint = gradientHorizontal ? CGPoint(x: 0.0, y: 0.5) : CGPoint(x: 0.5, y: 0.0)
        let endPoint = gradientHorizontal ? CGPoint(x: 1.0, y: 0.5) : CGPoint(x: 0.5, y: 1.0)

        gradient.startPoint = startPoint
        gradient.endPoint = endPoint

        return gradient
    }

    private func gradientColor(gradientLayer: CAGradientLayer) -> UIColor? {
        guard let image = CICommon.gradientImage(gradientLayer: gradientLayer) else {
            return nil
        }

        return UIColor(patternImage: image)
    }
}
