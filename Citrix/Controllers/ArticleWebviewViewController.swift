//
//  ArticleWebviewViewController.swift
//  Citrix
//
//  Created by Pranay Joshi on 12/06/22.
//

import UIKit
import WebKit

class ArticleWebviewViewController: UIViewController, WKNavigationDelegate {
    // MARK: - Declarations for outlets and variables.
    var webView: WKWebView!
    var webUrl = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: webUrl)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
