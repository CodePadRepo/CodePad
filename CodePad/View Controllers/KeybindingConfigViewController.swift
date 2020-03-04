//
//  KeybindingConfigViewController.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/03/04.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

class KeybindingConfigViewController: UITableViewController {
    var config: CodePadConfiguration!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        config = CodePadConfiguration()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == config.keybindingType.ordinal() {
            cell.accessoryType = .checkmark
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let previousKeybindingType = config.keybindingType
        let currentKeybindingType = KeybindingType(indexPath.row)!
        guard previousKeybindingType != currentKeybindingType else { return }
        
        if let previousCell = tableView.cellForRow(at: IndexPath(row: previousKeybindingType.ordinal(), section: indexPath.section)) {
            previousCell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        
        config.keybindingType = currentKeybindingType
    }
}
