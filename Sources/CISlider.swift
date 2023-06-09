//
//  CISlider.swift
//  CustomUIKitItems
//
//  Created by GonzaloMR on 1/6/23.
//

import UIKit

@IBDesignable
open class CISlider: UISlider {

    @IBInspectable public var trackHeight: CGFloat = 8 {
        didSet {
            setup()
        }
    }

    @IBInspectable public var gradientStartColor: UIColor = .clear {
        didSet {
            setup()
        }
    }
    
    @IBInspectable public var gradientMidColor: UIColor? {
        didSet {
            setup()
        }
    }
    
    @IBInspectable public var gradientEndColor: UIColor = .clear {
        didSet {
            setup()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// We cannot use layoutSubviews because of the necessary use of trackRect, these methods are not compatible betwwen each other.
    private func setup() {
        if self.minimumTrackTintColor == nil {
            self.setMinimumTrackImage(self.minimumTrackGradientColor(size: self.trackRect(forBounds: self.bounds).size), for: .normal)
        }
    }

    private func minimumTrackGradientColor(size: CGSize) -> UIImage? {
        let layer = CAGradientLayer()
        layer.frame = CGRect.init(x: 0, y: 0, width: size.width, height: trackHeight)
        layer.cornerRadius = layer.frame.height / 2
        layer.masksToBounds = false
        
        // If transparent colors, replaced with white transparent to avoid undesirable effects
        let startColor = gradientStartColor.isTransparent ? UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.0) : gradientStartColor
        let endColor = gradientEndColor.isTransparent ? UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.0) : gradientEndColor
        
        var colors: [CGColor] = [startColor.cgColor, endColor.cgColor]
        
        if let gradientMidColor = gradientMidColor {
            let midColor = gradientMidColor.isTransparent ? UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.0) : gradientMidColor
            colors.insert(midColor.cgColor, at: 1)
        }
        
        layer.colors = colors
        
        let startPoint = CGPoint(x: 0.0, y: 0.5)
        let endPoint = CGPoint(x: 1.0, y: 0.5)
        
        layer.startPoint = startPoint
        layer.endPoint = endPoint

        return CICommon.gradientImage(gradientLayer: layer)
    }

    public override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x,
            y: bounds.origin.y,
            width: bounds.width,
            height: trackHeight
        )
    }
}
