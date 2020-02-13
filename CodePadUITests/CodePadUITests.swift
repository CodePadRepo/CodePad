//
//  CodePadUITests.swift
//  CodePadUITests
//
//  Created by Ryang Sohn on 2020/02/10.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import XCTest

class CodePadUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testNewDocumentButtonShowAlert() {
        sleep(2)
        app.buttons["Add"].tap()
        
        sleep(2)
        XCTAssert(app.alerts.element.staticTexts["Create File"].exists)
    }

}
