//
//  DocumentBrowserViewController.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/01/07.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit


class DocumentBrowserViewController: UIDocumentBrowserViewController, UIDocumentBrowserViewControllerDelegate {
    static let newDocNumberKey = "newDocNumber"
    var DocumentClass = CodePadDocument.self // Remove coupling for unit testing
    var documentURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        allowsDocumentCreation = true
        allowsPickingMultipleItems = false
        if #available(iOS 13.0, *) {
            shouldShowFileExtensions = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    fileprivate func generateDocumentName() -> String {
        let newDocNumber = UserDefaults.standard.integer(forKey: DocumentBrowserViewController.newDocNumberKey)
        return "Untitled Code \(newDocNumber)"
    }
    
    fileprivate func incrementNameCount() {
        let newDocNumber = UserDefaults.standard.integer(forKey: DocumentBrowserViewController.newDocNumberKey) + 1
        UserDefaults.standard.set(newDocNumber, forKey: DocumentBrowserViewController.newDocNumberKey)
    }
    
    fileprivate func createDocumentURL(_ documentName: String) -> URL {
        let stubURL = UIApplication.cacheURL().appendingPathComponent(documentName)
        return stubURL
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didRequestDocumentCreationWithHandler importHandler: @escaping (URL?, UIDocumentBrowserViewController.ImportMode) -> Void) {
        let defaultDocumentName = generateDocumentName()
        var documentName: String? = nil
        incrementNameCount()
        
        let alert = UIAlertController(title: "Create File", message: "Enter file name", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.text = defaultDocumentName
            textField.placeholder = "File name"
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            documentName = alert.textFields?.first?.text ?? defaultDocumentName
            let newDocumentURL = self.createDocumentURL(documentName!)
            let newDocument = self.DocumentClass.init(fileURL: newDocumentURL)
            
            newDocument.save(to: newDocumentURL, for: .forCreating) { success in
                guard success else {
                    importHandler(nil, .none)
                    return
                }
                newDocument.close { (closeSuccess) in
                    guard closeSuccess else {
                        importHandler(nil, .none)
                        return
                    }
                    importHandler(newDocumentURL, .move)
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in
            importHandler(nil, .none)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didPickDocumentsAt documentURLs: [URL]) {
        guard let sourceURL = documentURLs.first else { return }
        
        presentDocument(at: sourceURL)
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didImportDocumentAt sourceURL: URL, toDestinationURL destinationURL: URL) {
        presentDocument(at: destinationURL)
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, failedToImportDocumentAt documentURL: URL, error: Error?) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let documentView = segue.destination as? DocumentViewController else { return }
        documentView.document = self.DocumentClass.init(fileURL: self.documentURL!)
        self.navigationItem.title = ""
    }
    
    func presentDocument(at documentURL: URL) {
        self.documentURL = documentURL
        performSegue(withIdentifier: "OpenFile", sender: nil)
    }
}

