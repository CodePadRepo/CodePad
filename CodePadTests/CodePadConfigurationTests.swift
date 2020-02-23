//
//  CodePadConfigurationTests.swift
//  CodePadTests
//
//  Created by Ryang Sohn on 2020/02/23.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import XCTest
@testable import CodePad

class CodePadConfigurationTests: XCTestCase {
    var indentationTypeBeforeTest: String!
    var indentationSizeBeforeTest: Int!

    override func setUp() {
        UserDefaults.standard.set(IndentationType.spaces.rawValue, forKey: "indentationType")
        UserDefaults.standard.set(4, forKey: "indentationSize")
        indentationTypeBeforeTest = (UserDefaults.standard.value(forKey: "indentationType") as! String)
        indentationSizeBeforeTest = (UserDefaults.standard.value(forKey: "indentationSize") as! Int)
    }

    override func tearDown() {
        UserDefaults.standard.set(indentationSizeBeforeTest, forKey: "indentationType")
        UserDefaults.standard.set(indentationSizeBeforeTest, forKey: "indentationSize")
    }

    func testCodePadConfiguration() {
        let conf = CodePadConfiguration()
        XCTAssertEqual(conf.indentationType.rawValue, indentationTypeBeforeTest)
        XCTAssertEqual(conf.indentationSize, indentationSizeBeforeTest)
        conf.indentationType = .tabs
        XCTAssertEqual(conf.indentationType.rawValue, UserDefaults.standard.value(forKey: "indentationType") as! String)
        conf.indentationSize = 2
        XCTAssertEqual(conf.indentationSize, UserDefaults.standard.value(forKey: "indentationSize") as! Int)
    }
}
