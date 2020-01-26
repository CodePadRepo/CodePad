//
//  DocumentViewController.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/01/07.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit
import WebKit

class DocumentViewController: UIViewController {
    var document: UIDocument?
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let conf = WKWebViewConfiguration()
        conf.userContentController.add(self, name: "editorMessageHandler")
        webView = WKWebView(frame: .zero, configuration: conf)
        view.addSubview(webView)
        let layoutGuide = view.safeAreaLayoutGuide
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        let url = Bundle.main.url(forResource: "TextEditor", withExtension: "html")!
        webView.loadFileURL(url, allowingReadAccessTo: url)
        webView.scrollView.delegate = self
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension DocumentViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return nil
    }
}

extension DocumentViewController: WKUIDelegate {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        let conf = WKWebViewConfiguration()
        conf.userContentController.add(self, name: "editorMessageHandler")
        return WKWebView(frame: webView.frame, configuration: conf)
    }
}

extension DocumentViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "editorMessageHandler" {
            guard let dict = message.body as? [String: AnyObject],
                let event = dict["event"] as? String,
                let data = dict["data"] as? Array<AnyObject> else {
                    return
            }
            switch event {
            case "editor_ready":
                do {
                    self.webView.evaluateJavaScript(
                        "editor.session.setValue(`\(try String(contentsOf: self.document!.fileURL))`);"
                    ) { (result, error) in
                        if error != nil {
                            print("Failed to change innerText")
                            print(error!)
                        }
                    }
                } catch {
                    print("Failed to read file content")
                }
                self.webView.evaluateJavaScript("""
editor.session.on("change", () => {
    console.log("Text changed");
    window.webkit.messageHandlers.editorMessageHandler.postMessage({
        event: "text_change",
        data: [editor.getValue()]
    });
});
"""
                ) { (result, error) in
                    if error != nil {
                        print("Failed to register change event")
                        print(error!)
                    }
                }
            case "text_change":
                let fileContents: String = data[0] as! String
                do {
                    print("Writing to file...")
                    try fileContents.write(to: self.document!.fileURL, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    print("Failed to write to file")
                }
            default:
                print("Unknown event: \(event)")
            }
        }
    }
}
