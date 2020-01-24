//
//  DocumentViewController.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/01/07.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit
import WebKit

class DocumentViewController: UIViewController, WKUIDelegate {
    var document: UIDocument?
    @IBOutlet weak var editorView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "TextEditor", withExtension: "html")!
        editorView.loadFileURL(url, allowingReadAccessTo: url)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        document?.open(completionHandler: { (success) in
            if success {
            } else {
            }
        })
    }
}
