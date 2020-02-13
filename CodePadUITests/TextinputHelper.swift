//
//  TextinputHelper.swift
//  CodePadUITests
//
//  Created by Ryang Sohn on 2020/02/13.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import XCTest

extension XCUIElement {
    func clearAndTypeText(_ text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        
        self.tap()
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
        self.typeText(text)
    }
}
