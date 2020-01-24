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
    var webView: WKWebView!
    
    override func loadView() {
        let webConf = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConf)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "TextEditor", withExtension: "html")!
        webView.loadFileURL(url, allowingReadAccessTo: url)
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
