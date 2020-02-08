//
//  Document.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/01/07.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import Foundation
import UIKit

class CodePadDocument: UIDocument {
    var code: String = "" {
        didSet {
            updateChangeCount(.done)
        }
    }
    
    override func contents(forType typeName: String) throws -> Any {
        // TODO: Add customizable encodings
        return self.code.data(using: .utf8) as Any
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // TODO: Add customizable encodings
        let fileData: Data = contents as! Data
        self.code = String(data: fileData, encoding: .utf8) ?? ""
    }
}

