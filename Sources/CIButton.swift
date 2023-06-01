//
//  CIButton.swift
//  CustomUIKitItems
//
//  Created by GonzaloMR on 1/6/23.
//

import UIKit

@IBDesignable
class CIButton: UIButton {
    
    private var gradientLayer: CAGradientLayer?
    
    @IBInspectable
    var enabledBgColor: UIColor?
    
    @IBInspectable
    var disabledBgColor: UIColor?
    
    @IBInspectable
    var alphaDisabledBgColor: CGFloat = 1.0
    
    @IBInspectable
    var alphaBgColor: CGFloat = 1.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable
    var alphaTintColor: CGFloat = 1.0 {
        didSet {
            layoutSubviews()
        }
    }
    
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
    
    @IBInspectable var gradientEndColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable var tapAnimation: Bool = false {
        didSet {
            layoutSubviews()
        }
    }

    override var isEnabled: Bool {
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

    override func layoutSubviews() {
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard tapAnimation else { return }

        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)

        super.touchesBegan(touches, with: event)
    }
}