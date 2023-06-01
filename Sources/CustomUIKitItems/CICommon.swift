//
//  CICommon.swift
//  CustomUIKitItems
//
//  Created by GonzaloMR on 1/6/23.
//

import UIKit

public class CICommon {
    static func gradientImage(gradientLayer: CAGradientLayer) -> UIImage? {
        // Create UIImage by rendering gradient layer
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        gradientLayer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }

        // Get gradient UIcolor from gradient UIImage
        UIGraphicsEndImageContext()
        return image
    }
}
