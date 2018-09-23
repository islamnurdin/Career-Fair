//
//  RegistrationViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/11/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import WebKit

class RegistrationViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var doneButton: UIToolbar!
    @IBOutlet weak var registerWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Регистрация"
        
        registerWebView.uiDelegate = self as? WKUIDelegate
        self.registerWebView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)

        let url = URL(string: "https://docs.google.com/forms/d/1NIdI2kh4zNOWQ3ZFHysFEji85tyC2Ml3S07lgTEPIoM/edit#responses")
        doneButton.isHidden = true
        registerWebView.load(URLRequest(url: url!))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == #keyPath(WKWebView.url) {
            
            let url = "\((self.registerWebView.url)!)"
            if url == "https://docs.google.com/forms/d/e/1FAIpQLSevckocpQKbsAVyn5xKaMBsDbR3rY90n5ItBoPy7xOAxfZkzw/formResponse" {
                doneButton.isHidden = false
                print("done: ", url)
            }
            else if url == "https://docs.google.com/forms/d/e/1FAIpQLSevckocpQKbsAVyn5xKaMBsDbR3rY90n5ItBoPy7xOAxfZkzw/alreadyresponded" {
                doneButton.isHidden = false
                print("already responded: ", url)
            }
            else if url == "https://docs.google.com/forms/d/1NIdI2kh4zNOWQ3ZFHysFEji85tyC2Ml3S07lgTEPIoM/alreadyresponded?edit_requested=true#responses" {
                doneButton.isHidden = false
                print("responded true: ", url)
            }
        }
    }
    
}
