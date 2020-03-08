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
    static let shared = FontProvider()
    static let fonts = [
        UIFont(name: "FantasqueSansMono-Regular", size: 10)!,
        UIFont(name: "FiraCode-Regular", size: 10)!,
        UIFont(name: "Hack-Regular", size: 10)!,
        UIFont(name: "Inconsolata-Regular", size: 10)!,
        UIFont(name: "MesloLGM-Regular", size: 10)!
    ]
    private var observers: NSHashTable<AnyObject> = NSHashTable.weakObjects()
    var font: UIFont {
        didSet {
            notifyObservers()
        }
    }
    
    func register<Observer: FontConfigurable>(observer: Observer) {
        observer.apply(font: font)
        self.observers.add(observer)
    }
    
    private func notifyObservers() {
        DispatchQueue.main.async {
            self.observers.allObjects
                .compactMap({ $0 as? FontConfigurable })
                .forEach({ $0.apply(font: self.font) })
        }
    }
    
    private init() {
        let config = CodePadConfiguration()
        font = FontProvider.fonts.first(where: { $0.familyName == config.fontFamilyName })!
    }
}
