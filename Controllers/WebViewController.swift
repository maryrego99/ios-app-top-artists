//
//  WebViewController.swift
//  Multi Screen App
//
//  Created by Sabin Tabirca on 11/02/2025.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var personWebView: WKWebView!
    
    // model data
    var urlData : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "web"

        let urlData = URL(string: urlData) ?? URL(string: "https://www.google.com/")
                
        let webURLRequest = URLRequest(url: urlData!)
            
        personWebView.load(webURLRequest)
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
