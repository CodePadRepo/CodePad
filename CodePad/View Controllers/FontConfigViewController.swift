//
//  FontConfigViewController.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/03/07.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

class FontConfigViewController: UITableViewController {
    var config: CodePadConfiguration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config = CodePadConfiguration()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Font"
        } else if section == 1 {
            return "Font Size"
        } else {
            return "Ligatures"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return FontProvider.fonts.count
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = FontProvider.fonts[indexPath.row].familyName
            cell.textLabel?.font = UIFont(name: FontProvider.fonts[indexPath.row].fontName, size: 17)
        } else if indexPath.section == 1 {
            let textInputCell = TextInputTableViewCell()
            textInputCell.cellText = "Font Size"
            textInputCell.textInput.placeholder = "Font size"
            textInputCell.selectionStyle = .none
            return textInputCell
        } else {
            cell.textLabel?.text = "Turn on Ligatures"
            cell.accessoryView = UISwitch()
            cell.selectionStyle = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if cell.textLabel?.font.familyName == config.fontFamilyName {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        } else if indexPath.section == 1 {
            let textInputCell = cell as! TextInputTableViewCell
            textInputCell.textInput.text = String(config.fontSize)
            textInputCell.textInput.addTarget(self, action: #selector(fontSizeEdited), for: UIControl.Event.editingChanged)
        } else {
            let ligatureSwitch = cell.accessoryView as! UISwitch
            ligatureSwitch.isOn = config.ligatureEnabled
            ligatureSwitch.addTarget(self, action: #selector(ligatureSettingEdited), for: UIControl.Event.allTouchEvents)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard indexPath.section == 0 else { return }
        let previousFont = FontProvider.fonts.first(where: { $0.familyName == config.fontFamilyName })!
        let currentFont = FontProvider.fonts[indexPath.row]
        guard previousFont != currentFont else { return }
        
        if let previousCell = tableView.cellForRow(at: IndexPath(row: FontProvider.fonts.firstIndex(of: previousFont)!, section: 0)) {
            previousCell.accessoryType = .none
        }
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        
        config.fontFamilyName = currentFont.familyName
    }
    
    @objc func fontSizeEdited() {
        #if targetEnvironment(simulator)
        print("Font size edited")
        #endif
        let inputCell = tableView.cellForRow(at: IndexPath(row: 0, section: 1))! as! TextInputTableViewCell
        guard let inputText = inputCell.textInput.text else { return }
        guard let fontSize = Int(inputText) else { return }
        config.fontSize = fontSize
    }
    
    @objc func ligatureSettingEdited() {
        #if targetEnvironment(simulator)
        print("Ligature setting edited")
        #endif
        let inputCell = tableView.cellForRow(at: IndexPath(row: 0, section: 2))!
        let ligatureSwitch = inputCell.accessoryView as! UISwitch
        config.ligatureEnabled = ligatureSwitch.isOn
    }
}
