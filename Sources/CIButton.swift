//
//  CIButton.swift
//  CustomUIKitItems
//
//  Created by GonzaloMR on 1/6/23.
//

import UIKit

@IBDesignable
open class CIButton: UIButton {
    
    private var gradientLayer: CAGradientLayer?
    
    @IBInspectable public var enabledBgColor: UIColor?
    
    @IBInspectable public var disabledBgColor: UIColor?
    
    @IBInspectable public var alphaDisabledBgColor: CGFloat = 1.0
    
    @IBInspectable public var alphaBgColor: CGFloat = 1.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var alphaTintColor: CGFloat = 1.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var roundedCorners: Bool = false {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var gradientStartColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var gradientEndColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize = .zero {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable public var tapAnimation: Bool = false {
        didSet {
            layoutSubviews()
        }
    }

    public override var isEnabled: Bool {
        didSet {
            guard oldValue != isEnabled else { return }
            
            if isEnabled {
                if let bgColor = enabledBgColor {
                    backgroundColor = bgColor
                }
            } else {
                if let bgColor = disabledBgColor {
                    backgroundColor = bgColor
                }
            }
        }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        
        // Border
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        if roundedCorners {
            layer.cornerRadius = frame.height / 2.0
        } else {
            // Corner radius
            layer.cornerRadius = cornerRadius
        }
        
        // Apply custom alpha only if bg color has not alpha already applied
        if let bgColor = backgroundColor, !bgColor.hasAlpha {
            let alpha = isEnabled ? alphaBgColor : alphaDisabledBgColor
            backgroundColor = backgroundColor?.withAlphaComponent(alpha)
        }
        
        // Apply custom tint alpha only if tint color has not alpha already applied
        if !tintColor.hasAlpha {
            tintColor = tintColor.withAlphaComponent(alphaTintColor)
        }
        
        // Shadow
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        
        // Gradient
        applyGradient()
    }
    
    private func applyGradient() {
        guard let gradient = gradientLayer else {
            gradientLayer = CAGradientLayer()
            layer.insertSublayer(gradientLayer!, at: 0)
            return
        }
        
        gradient.cornerRadius = layer.cornerRadius
        gradient.frame = bounds
        gradient.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        
        let startPoint = CGPoint(x: 0.0, y: 0.5)
        let endPoint = CGPoint(x: 1.0, y: 0.5)
        
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if tapAnimation {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: nil)

            super.touchesBegan(touches, with: event)
        }
    }
}
