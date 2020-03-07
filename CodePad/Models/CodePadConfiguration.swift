//
//  CodePadConfiguration.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/02/23.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import Foundation

enum IndentationType: String {
    case tabs
    case spaces
    
    init?(_ int: Int) {
        switch int {
        case 0: self = .tabs
        case 1: self = .spaces
        default: return nil
        }
    }
    
    func ordinal() -> Int {
        switch self {
        case .tabs: return 0
        case .spaces: return 1
        }
    }
}

enum KeybindingType: String {
    case ace
    case vim
    case emacs
    case sublime
    case vscode
    
    init?(_ int: Int) {
        switch int {
        case 0: self = .ace
        case 1: self = .vim
        case 2: self = .emacs
        case 3: self = .sublime
        case 4: self = .vscode
        default: return nil
        }
    }
    
    func ordinal() -> Int {
        switch self {
        case .ace: return 0
        case .vim: return 1
        case .emacs: return 2
        case .sublime: return 3
        case .vscode: return 4
        }
    }
}

enum ThemeType: String {
    case light
    case dark
}

class CodePadConfiguration {
    static let indentationTypeKey = "indentationType"
    var indentationType: IndentationType = .spaces {
        didSet {
            UserDefaults.standard.setValue(self.indentationType.rawValue, forKeyPath: CodePadConfiguration.indentationTypeKey)
        }
    }
    static let indentationSizeKey = "indentationSize"
    var indentationSize: Int = 4 {
        didSet {
            UserDefaults.standard.setValue(indentationSize, forKeyPath: CodePadConfiguration.indentationSizeKey)
        }
    }
    static let keybindingTypeKey = "keybindingType"
    var keybindingType: KeybindingType = .vscode {
        didSet {
            UserDefaults.standard.setValue(self.keybindingType.rawValue, forKeyPath: CodePadConfiguration.keybindingTypeKey)
        }
    }
    static let colorSchemeKey = "colorScheme"
    var colorScheme: String = "gruvbox" {
        didSet {
            UserDefaults.standard.setValue(self.colorScheme, forKeyPath: CodePadConfiguration.colorSchemeKey)
        }
    }
    static let themeTypeKey = "themeType"
    var themeType: ThemeType = .light {
        didSet {
            UserDefaults.standard.setValue(self.themeType.rawValue, forKeyPath: CodePadConfiguration.themeTypeKey)
        }
    }
    static let fontNameKey = "fontFamily"
    var fontName: String = "FiraCode-Regular" {
        didSet {
            UserDefaults.standard.setValue(self.fontName, forKeyPath: CodePadConfiguration.fontNameKey)
        }
    }
    
    init() {
        self.indentationType = IndentationType(rawValue: UserDefaults.standard.value(forKey: CodePadConfiguration.indentationTypeKey) as? String ?? IndentationType.spaces.rawValue)!
        self.indentationSize = UserDefaults.standard.value(forKey: CodePadConfiguration.indentationSizeKey) as? Int ?? 4
        self.keybindingType = KeybindingType(rawValue: UserDefaults.standard.value(forKey: CodePadConfiguration.keybindingTypeKey) as? String ?? KeybindingType.vscode.rawValue)!
        self.colorScheme = UserDefaults.standard.value(forKey: CodePadConfiguration.colorSchemeKey) as? String ?? "gruvbox"
        self.themeType = ThemeType(rawValue: UserDefaults.standard.value(forKey: CodePadConfiguration.themeTypeKey) as? String ?? ThemeType.light.rawValue)!
        self.fontName = UserDefaults.standard.value(forKey: CodePadConfiguration.fontNameKey) as? String ?? "FiraCode-Regular"
    }
}
