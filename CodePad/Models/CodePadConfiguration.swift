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
}

extension IndentationType {
    init?(_ int: Int) {
        switch int {
        case 0: self = .tabs
        case 1: self = .spaces
        default: return nil
        }
    }
}

let sharedCodePadConfiguration = CodePadConfiguration()
class CodePadConfiguration {
    let indentationTypeKey = "indentationType"
    var indentationType: IndentationType = .spaces {
        didSet {
            UserDefaults.standard.setValue(self.indentationType.rawValue, forKeyPath: indentationTypeKey)
        }
    }
    let indentationSizeKey = "indentationSize"
    var indentationSize: Int = 4 {
        didSet {
            UserDefaults.standard.setValue(indentationSize, forKeyPath: indentationSizeKey)
        }
    }
    
    init() {
        self.indentationType = IndentationType(rawValue: UserDefaults.standard.value(forKey: indentationTypeKey) as? String ?? IndentationType(rawValue: IndentationType.spaces.rawValue)!.rawValue)!
        self.indentationSize = UserDefaults.standard.value(forKey: indentationSizeKey) as? Int ?? 4
    }
}
