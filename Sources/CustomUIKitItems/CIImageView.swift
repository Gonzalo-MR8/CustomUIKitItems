//
//  CIImageView.swift
//  CustomUIKitItems
//
//  Created by GonzaloMR on 1/6/23.
//

import UIKit

class CIImageView: UIImageView {

    @IBInspectable
    var alphaTintColor: CGFloat = 1.0 {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var circularImageView: Bool = false {
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

    @IBInspectable
    var alphaBgColor: CGFloat = 1.0 {
        didSet {
            layoutSubviews()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if circularImageView {
            layer.cornerRadius = bounds.size.width / 2.0
        } else {
            // Corner radius
            layer.cornerRadius = cornerRadius
        }
        
        // Border
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth

        // Apply custom alpha only if bg color has not alpha already applied
        if let bgColor = backgroundColor, !bgColor.hasAlpha {
            backgroundColor = backgroundColor?.withAlphaComponent(alphaBgColor)
        }

        // Apply custom tint alpha only if tint color has not alpha already applied
        if !tintColor.hasAlpha {
            tintColor = tintColor.withAlphaComponent(alphaTintColor)
        }
    }

}
