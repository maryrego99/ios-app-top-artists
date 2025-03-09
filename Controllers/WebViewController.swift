//
//  WebViewController.swift
//  Multi Screen App
//
//  Created by Sabin Tabirca on 11/02/2025.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    //MARK: - Outlets
    
    @IBOutlet weak var personWebView: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // model data
    var urlData : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personWebView.navigationDelegate = self
        
//        title = "web"

        let urlData = URL(string: urlData) ?? URL(string: "https://www.google.com/")
//        let urlData = URL(string: "https://open.spotify.com/embed/track/1daDRI9ahBonbWD8YcxOIB?si=MnjACuQ1TFS8--UfZEDx3Q") ?? URL(string: "https://www.google.com/")
                
        let webURLRequest = URLRequest(url: urlData!)
            
        personWebView.load(webURLRequest)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }

    // Stop loading animation when webpage finishes loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.readyState") { (complete, error) in
                if complete as? String == "complete" {
                    self.activityIndicator.stopAnimating()
                }
            }
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
