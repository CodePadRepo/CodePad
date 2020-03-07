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
    var keybindingTypeBeforeTest: String!
    var colorSchemeBeforeTest: String!
    var themeTypeBeforeTest: String!
    var fontNameBeforeTest: String!
    var fontSizeBeforeTest: Int!
    var ligatureEnabledBeforeTest: Bool!

    override func setUp() {
        UserDefaults.standard.set(IndentationType.spaces.rawValue, forKey: CodePadConfiguration.indentationTypeKey)
        UserDefaults.standard.set(4, forKey: CodePadConfiguration.indentationSizeKey)
        UserDefaults.standard.set(KeybindingType.ace.rawValue, forKey: CodePadConfiguration.keybindingTypeKey)
        UserDefaults.standard.set("gruvbox", forKey: CodePadConfiguration.colorSchemeKey)
        UserDefaults.standard.set(ThemeType.dark.rawValue, forKey: CodePadConfiguration.themeTypeKey)
        UserDefaults.standard.set("Inconsolata", forKey: CodePadConfiguration.fontFamilyNameKey)
        UserDefaults.standard.set(13, forKey: CodePadConfiguration.fontSizeKey)
        UserDefaults.standard.set(false, forKey: CodePadConfiguration.ligatureEnabledKey)
        indentationTypeBeforeTest = (UserDefaults.standard.value(forKey: CodePadConfiguration.indentationTypeKey) as! String)
        indentationSizeBeforeTest = (UserDefaults.standard.value(forKey: CodePadConfiguration.indentationSizeKey) as! Int)
        keybindingTypeBeforeTest = (UserDefaults.standard.value(forKey: CodePadConfiguration.keybindingTypeKey) as! String)
        colorSchemeBeforeTest = (UserDefaults.standard.value(forKey: CodePadConfiguration.colorSchemeKey) as! String)
        themeTypeBeforeTest = (UserDefaults.standard.value(forKey: CodePadConfiguration.themeTypeKey) as! String)
        fontNameBeforeTest = (UserDefaults.standard.value(forKey: CodePadConfiguration.fontFamilyNameKey) as! String)
        fontSizeBeforeTest = (UserDefaults.standard.value(forKey: CodePadConfiguration.fontSizeKey) as! Int)
        ligatureEnabledBeforeTest = (UserDefaults.standard.value(forKey: CodePadConfiguration.ligatureEnabledKey) as! Bool)
    }

    override func tearDown() {
        cleanUp()
    }
    
    fileprivate func cleanUp() {
        UserDefaults.standard.removeObject(forKey: CodePadConfiguration.indentationTypeKey)
        UserDefaults.standard.removeObject(forKey: CodePadConfiguration.indentationSizeKey)
        UserDefaults.standard.removeObject(forKey: CodePadConfiguration.keybindingTypeKey)
        UserDefaults.standard.removeObject(forKey: CodePadConfiguration.colorSchemeKey)
        UserDefaults.standard.removeObject(forKey: CodePadConfiguration.themeTypeKey)
        UserDefaults.standard.removeObject(forKey: CodePadConfiguration.fontFamilyNameKey)
        UserDefaults.standard.removeObject(forKey: CodePadConfiguration.fontSizeKey)
        UserDefaults.standard.removeObject(forKey: CodePadConfiguration.ligatureEnabledKey)
    }

    func testCodePadConfiguration() {
        let conf = CodePadConfiguration()
        XCTAssertEqual(conf.indentationType.rawValue, indentationTypeBeforeTest)
        XCTAssertEqual(conf.indentationSize, indentationSizeBeforeTest)
        XCTAssertEqual(conf.keybindingType.rawValue, keybindingTypeBeforeTest)
        XCTAssertEqual(conf.colorScheme, colorSchemeBeforeTest)
        XCTAssertEqual(conf.themeType.rawValue, themeTypeBeforeTest)
        XCTAssertEqual(conf.fontFamilyName, fontNameBeforeTest)
        XCTAssertEqual(conf.fontSize, fontSizeBeforeTest)
        XCTAssertEqual(conf.ligatureEnabled, ligatureEnabledBeforeTest)
        conf.indentationType = .tabs
        XCTAssertEqual(conf.indentationType.rawValue, UserDefaults.standard.value(forKey: CodePadConfiguration.indentationTypeKey) as! String)
        conf.indentationSize = 2
        XCTAssertEqual(conf.indentationSize, UserDefaults.standard.value(forKey: CodePadConfiguration.indentationSizeKey) as! Int)
        conf.keybindingType = .vim
        XCTAssertEqual(conf.keybindingType.rawValue, UserDefaults.standard.value(forKey: CodePadConfiguration.keybindingTypeKey) as! String)
        conf.colorScheme = "chrome"
        XCTAssertEqual(conf.colorScheme, UserDefaults.standard.value(forKey: CodePadConfiguration.colorSchemeKey) as! String)
        conf.themeType = .light
        XCTAssertEqual(conf.themeType.rawValue, UserDefaults.standard.value(forKey: CodePadConfiguration.themeTypeKey) as! String)
        conf.fontFamilyName = "Hack"
        XCTAssertEqual(conf.fontFamilyName, UserDefaults.standard.value(forKey: CodePadConfiguration.fontFamilyNameKey) as! String)
        conf.fontSize = 15
        XCTAssertEqual(conf.fontSize, UserDefaults.standard.value(forKey: CodePadConfiguration.fontSizeKey) as! Int)
        conf.ligatureEnabled = true
        XCTAssertEqual(conf.ligatureEnabled, UserDefaults.standard.value(forKey: CodePadConfiguration.ligatureEnabledKey) as! Bool)
    }
    
    func testIndentationType() {
        XCTAssertEqual(IndentationType.tabs, IndentationType(0))
        XCTAssertEqual(IndentationType.spaces, IndentationType(1))
        XCTAssertNil(IndentationType(2))
        XCTAssertEqual(IndentationType.tabs.ordinal(), 0)
        XCTAssertEqual(IndentationType.spaces.ordinal(), 1)
    }
    
    func testKeybindingType() {
        XCTAssertEqual(KeybindingType.ace.rawValue, "ace")
        XCTAssertEqual(KeybindingType.vim.rawValue, "vim")
        XCTAssertEqual(KeybindingType.emacs.rawValue, "emacs")
        XCTAssertEqual(KeybindingType.sublime.rawValue, "sublime")
        XCTAssertEqual(KeybindingType.vscode.rawValue, "vscode")
        XCTAssertEqual(KeybindingType.ace.ordinal(), 0)
        XCTAssertEqual(KeybindingType.vim.ordinal(), 1)
        XCTAssertEqual(KeybindingType.emacs.ordinal(), 2)
        XCTAssertEqual(KeybindingType.sublime.ordinal(), 3)
        XCTAssertEqual(KeybindingType.vscode.ordinal(), 4)
        XCTAssertEqual(KeybindingType.ace, KeybindingType(0))
        XCTAssertEqual(KeybindingType.vim, KeybindingType(1))
        XCTAssertEqual(KeybindingType.emacs, KeybindingType(2))
        XCTAssertEqual(KeybindingType.sublime, KeybindingType(3))
        XCTAssertEqual(KeybindingType.vscode, KeybindingType(4))
        XCTAssertNil(KeybindingType(5))
    }
    
    func testDefaultConfiguration() {
        cleanUp()
        let conf = CodePadConfiguration()
        XCTAssertEqual(conf.indentationType, IndentationType.spaces)
        XCTAssertEqual(conf.indentationSize, 4)
        XCTAssertEqual(conf.keybindingType, KeybindingType.vscode)
        XCTAssertEqual(conf.colorScheme, "gruvbox")
        XCTAssertEqual(conf.themeType, ThemeType.light)
        XCTAssertEqual(conf.fontFamilyName, "Fira Code")
        XCTAssertEqual(conf.fontSize, 12)
        XCTAssertEqual(conf.ligatureEnabled, true)
    }
}
