//
//  ColorBrightnessTests.swift
//  CodePadTests
//
//  Created by Ryang Sohn on 2020/02/23.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import XCTest
@testable import CodePad

class ColorBrightnessTests: XCTestCase {
    func testColorBrightness() {
        let white = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        XCTAssert(white.isLight)
        let black = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        XCTAssert(!black.isLight)
        let yellow = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        XCTAssert(yellow.isLight)
        let cyan = UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        XCTAssert(cyan.isLight)
    }
}
