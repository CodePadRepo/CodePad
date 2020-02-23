//
//  ColorBrightnessHelper.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/02/22.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

extension UIColor {
    func isLight(threshold: Float = 0.5) -> Bool? {
        let original = self.cgColor
        let RGBColor = original.converted(to: CGColorSpaceCreateDeviceRGB(), intent: .defaultIntent, options: nil)
        guard let components = RGBColor?.components else {
            return nil
        }
        guard components.count >= 3 else {
            return nil
        }
        
        let brightness = Float(((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000)
        return brightness > threshold
    }
}
