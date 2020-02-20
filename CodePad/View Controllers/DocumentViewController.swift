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
    var document: CodePadDocument?
    var webView: WKWebView!
    var theme: String!

    fileprivate func prepareWebView() {
        let conf = WKWebViewConfiguration()
        conf.userContentController.add(self, name: "editorMessageHandler")
        webView = WKWebView(frame: .zero, configuration: conf)
        webView.scrollView.isScrollEnabled = false
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
    
    fileprivate func loadSettings() {
        let defaults = UserDefaults.standard
        if let themeIndex = defaults.string(forKey: "colorTheme") {
            let readableThemeName = GlobalConstsHelper.colorThemes[Int(themeIndex)!]
            let processedThemeName = readableThemeName.replacingOccurrences(of: " ", with: "_").lowercased()
            self.theme = processedThemeName
            #if targetEnvironment(simulator)
            print("Color theme set to: \(String(describing: self.theme))")
            #endif
        } else {
            self.theme = "Gruvbox"
            #if targetEnvironment(simulator)
            print("Color theme not set")
            #endif
        }
    }
    
    fileprivate func setNavbar() {
        self.title = document?.fileURL.lastPathComponent
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Command Icon"), style: .plain, target: self, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareWebView()
        loadSettings()
        setNavbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        #if targetEnvironment(simulator)
        print("Keyboard Change")
        #endif
        
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        #if targetEnvironment(simulator)
        print(keyboardValue)
        #endif
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        #if targetEnvironment(simulator)
        print("keyboardViewEndFrame = \(keyboardViewEndFrame)")
        #endif
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            self.webView.evaluateJavaScript("document.body.style.height = '\(webView.frame.height)px';editor.resize(true);") { (result, error) in
                if error != nil {
                    #if targetEnvironment(simulator)
                    print("Failed to resize editor")
                    debugPrint(error!)
                    #endif
                }
            }
        } else {
            self.webView.evaluateJavaScript("document.body.style.height = '\(webView.frame.height -  keyboardViewEndFrame.height + view.safeAreaInsets.bottom)px';editor.resize(true);") { (result, error) in
                if error != nil {
                    #if targetEnvironment(simulator)
                    print("Failed to resize editor")
                    debugPrint(error!)
                    #endif
                }
            }
        }
    }
    
    fileprivate func initializeEditor() {
        let theme = self.theme!
        let filename = self.document!.fileURL.lastPathComponent
        self.webView.evaluateJavaScript("initializeEditor('\(theme)', '\(filename)', `\(document!.code.replacingOccurrences(of: "\\", with: "\\\\").replacingOccurrences(of: "`", with: "\\`"))`)") { (result, error) in
            if error != nil {
                #if targetEnvironment(simulator)
                print("Failed to initialize editor")
                debugPrint(error!)
                #endif
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
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
                self.document!.open(completionHandler: { (success) in
                    guard success else {
                        fatalError("Failed to open file")
                    }
                    #if targetEnvironment(simulator)
                    print("File opened")
                    print("Current content: \(self.document!.code)")
                    #endif
                    self.initializeEditor()
                })
            case "text_change":
                let fileContents: String = data[0] as! String
                self.document!.code = fileContents
                #if targetEnvironment(simulator)
                print("Writing to file...")
                #endif
                self.document!.save(to: document!.fileURL, for: .forOverwriting, completionHandler: nil)
            default:
                #if targetEnvironment(simulator)
                print("Unknown event: \(event)")
                #endif
            }
        }
    }
}
