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
        app.launchArguments = [
            "-NSTreatUnknownArgumentsAsOpen", "NO",
            "-ApplePersistenceIgnoreState", "YES"
        ]
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDocumentCreation() {
        app.launch()
        
        sleep(2)
        app.buttons["Add"].tap()
        
        sleep(2)
        XCTAssert(app.alerts.element.staticTexts["Create File"].exists)
        
        sleep(2)
        let newFileName = "test.py"
        let filenameTextfield = app.alerts.element.textFields.firstMatch
        XCTAssertNotNil(filenameTextfield)
        XCTAssertEqual(filenameTextfield.placeholderValue, "File name")
        filenameTextfield.clearAndTypeText(newFileName)
        app.alerts.element.buttons["OK"].tap()
    }

}
