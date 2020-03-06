//
//  ColorSchemeConfigViewController.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/03/05.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

class ColorSchemeConfigViewController: UITableViewController {
    var config: CodePadConfiguration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config = CodePadConfiguration()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Light Color Scheme"
        } else {
            return "Dark Color Scheme"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ColorSchemeHelper.colorSchemes.filter{$0.type.rawValue == section}.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorSchemeCell", for: indexPath)
        cell.textLabel?.text = ColorSchemeHelper.colorSchemes
            .filter{$0.type.rawValue == indexPath.section}
            .map{$0.readableName}[indexPath.row]
        cell.editingAccessoryType = .checkmark
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currentColorScheme = ColorSchemeHelper.colorSchemes.first(where: { $0.aceReadableName == config.colorScheme})!
        if currentColorScheme.readableName == cell.textLabel?.text {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let previousColorScheme = ColorSchemeHelper.colorSchemes.first(where: { $0.aceReadableName == config.colorScheme})!
        let currentColorScheme = ColorSchemeHelper.schemes(forType: ColorSchemeType(rawValue: indexPath.section)!)[indexPath.row]
        guard previousColorScheme != currentColorScheme else { return }
        
        if let previousCell = tableView.cellForRow(at: IndexPath(row: Int(ColorSchemeHelper.schemes(forType: previousColorScheme.type).firstIndex(of: previousColorScheme)!), section: previousColorScheme.type.rawValue)) {
            previousCell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        
        config.colorScheme = currentColorScheme.aceReadableName
    }
}
