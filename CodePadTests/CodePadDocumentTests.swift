//
//  CodePadDocumentTests.swift
//  CodePadDocumentTests
//
//  Created by Ryang Sohn on 2020/01/07.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import XCTest
@testable import CodePad

class CodePadDocumentTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCodePadDocumentContents() {
        let testDoc = MockCodePadDocument(fileURL: URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).appendingPathComponent("test.py"))
        let sampleCode = "print('Hello, world!')"
        testDoc.code = sampleCode
        let rawData = sampleCode.data(using: .utf8)
        XCTAssertEqual(try! testDoc.contents(forType: "") as! Data, rawData)
    }
    
    func testCodePadDoocumentLoad() {
        let testDoc = MockCodePadDocument(fileURL: URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).appendingPathComponent("test.py"))
        let sampleCode = "print('Hello, world!')"
        let rawData = sampleCode.data(using: .utf8)
        try! testDoc.load(fromContents: rawData!, ofType: nil)
        XCTAssertEqual(testDoc.code, sampleCode)
    }
}
