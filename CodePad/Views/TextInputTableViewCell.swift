//
//  TextInputTableViewCell.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/02/29.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

@IBDesignable
class TextInputTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var cellTextLabel: UILabel!
    @IBOutlet weak var textInput: UITextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFromNib()
    }
}
