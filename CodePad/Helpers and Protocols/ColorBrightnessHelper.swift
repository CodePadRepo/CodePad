//
//  ColorBrightnessHelper.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/02/22.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.5
    }
}
