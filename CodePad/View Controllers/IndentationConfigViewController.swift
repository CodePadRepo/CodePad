//
//  IndentationConfigViewController.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/02/23.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

class IndentaionControllerViewController: UITableViewController, TextInputTableViewCellDelegate {
    var config: CodePadConfiguration!
    @IBOutlet weak var indentSizeCell: TextInputTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indentSizeCell.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        config = CodePadConfiguration()
    }
    
    func textInputEdited() {
        #if targetEnvironment(simulator)
        print("Text changed in indent size textfield")
        #endif
        guard let inputText = indentSizeCell.textInput.text else { return }
        guard let indentSize = Int(inputText) else { return }
        config.indentationSize = indentSize
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if config.indentationType.ordinal() == indexPath.row {
                cell.accessoryType = .checkmark
            }
        } else {
            let indentSizeCell = cell as! TextInputTableViewCell
            indentSizeCell.textInput.text = String(config.indentationSize)
            cell.selectionStyle = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section != 1 else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        let previousIndentType = config.indentationType
        let currentIndentType: IndentationType = IndentationType(indexPath.row)!
        guard previousIndentType != currentIndentType else { return }
        
        if let previousCell = tableView.cellForRow(at: IndexPath(row: previousIndentType.ordinal(), section: indexPath.section)) {
            previousCell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        
        config.indentationType = currentIndentType
    }
}
