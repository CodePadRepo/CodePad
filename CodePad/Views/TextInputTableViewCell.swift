//
//  TextInputTableViewCell.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/02/29.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

protocol TextInputTableViewCellDelegate: class {
    func textInputEdited()
}

@IBDesignable
class TextInputTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var cellTextLabel: UILabel!
    @IBOutlet weak var textInput: UITextField!
    @IBInspectable var cellText: String! {
        didSet {
            cellTextLabel.text = cellText
        }
    }
    @IBInspectable var textInputPlaceholder: String! {
        didSet {
            textInput.placeholder = textInputPlaceholder
        }
    }
    weak var delegate: TextInputTableViewCellDelegate?
    var textInputEdited: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
    }
    
    @IBAction func textInputEditingChanged(_ sender: Any) {
        if textInputEdited != nil {
            textInputEdited!()
        } else {
            delegate?.textInputEdited()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFromNib()
    }
}
