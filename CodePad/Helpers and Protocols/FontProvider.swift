//
//  FontProvider.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/03/07.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

protocol FontConfigurable: class {
    func apply(font: UIFont)
}

class FontProvider {
    static let fonts = [
        UIFont(name: "FantasqueSansMono-Regular", size: 10)!,
        UIFont(name: "FiraCode-Regular", size: 10)!,
        UIFont(name: "Hack-Regular", size: 10)!,
        UIFont(name: "Inconsolata-Regular", size: 10)!,
        UIFont(name: "MesloLGM-Regular", size: 10)!
    ]
}
