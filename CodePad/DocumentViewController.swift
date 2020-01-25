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
        editorView.scrollView.delegate = self
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
             scrollView.pinchGestureRecognizer?.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        document?.open(completionHandler: { (success) in
            if success {
                do {
                    self.editorView.evaluateJavaScript(
                        "document.body.querySelector('#editor').innerText = `\(try String(contentsOf: self.document!.fileURL))`"
                    ) { (result, error) in
                        // TODO: Add proper error handling
                        if error != nil {
                            print(error!)
                        }
                    }
                } catch {
                    print("Failed to open file")
                }
            } else {
                // TODO: Add proper error handling
            }
        })
    }
}

extension DocumentViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return nil
    }
}
