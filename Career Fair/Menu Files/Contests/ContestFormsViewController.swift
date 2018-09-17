//
//  ContestFormsViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/17/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import WebKit

class ContestFormsViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: urlString)
        webView.load(URLRequest(url: url!))
    }

}
