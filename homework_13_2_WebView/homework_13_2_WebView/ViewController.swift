//
//  ViewController.swift
//  homework_13_2_WebView
//
//  Created by huyu on 2018/12/16.
//  Copyright © 2018年 hy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var urlTF: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string:"https://www.baidu.com"){
            webView.load(URLRequest(url: url))
        }
    }


    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    @IBAction func go(_ sender: Any) {
        if let url = URL(string:urlTF.text!){
            webView.load(URLRequest(url: url))
        }
    }
}

