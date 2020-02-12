//
//  MockCodePadDocument.swift
//  CodePadUITests
//
//  Created by Ryang Sohn on 2020/02/10.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit
@testable import CodePad

class MockCodePadDocument: CodePadDocument {
    override func save(to url: URL, for saveOperation: UIDocument.SaveOperation, completionHandler: ((Bool) -> Void)? = nil) {
        guard let handler = completionHandler else { return }
        handler(true)
    }
    
    override func close(completionHandler: ((Bool) -> Void)? = nil) {
        guard let handler = completionHandler else { return }
        handler(true)
    }
    
    override func open(completionHandler: ((Bool) -> Void)? = nil) {
        guard let handler = completionHandler else { return }
        handler(true)
    }
}
