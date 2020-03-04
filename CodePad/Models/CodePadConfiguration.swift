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
    
    init() {
        self.indentationType = IndentationType(rawValue: UserDefaults.standard.value(forKey: CodePadConfiguration.indentationTypeKey) as? String ?? IndentationType(rawValue: IndentationType.spaces.rawValue)!.rawValue)!
        self.indentationSize = UserDefaults.standard.value(forKey: CodePadConfiguration.indentationSizeKey) as? Int ?? 4
    }
}
