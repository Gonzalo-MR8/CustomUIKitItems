//
//  CITextView.swift
//  CustomUIKitItems
//
//  Created by GonzaloMR on 1/6/23.
//

import UIKit

@IBDesignable
public class CITextView: UITextView {

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

    @IBInspectable
    var horInsets: CGFloat = 12.0 {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable
    var shadowColor: UIColor = .clear {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable
    var shadowOpacity: Float = 0 {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable
    var shadowOffset: CGSize = .zero {
        didSet {
            layoutSubviews()
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        // Border
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth

        // Shadow
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius

        // Corner radius
        if roundedCorners {
            layer.cornerRadius = frame.height / 2.0
        } else {
            layer.cornerRadius = cornerRadius
        }
    }

}
