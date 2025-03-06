//
//  PersonViewController.swift
//  Multi Screen App
//
//  Created by Sabin Tabirca on 11/02/2025.
//

import UIKit
import WebKit

class ArtistViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var artistImageContainerView: UIView!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var songWebView: WKWebView!
    
    @IBAction func moreInfoAction(_ sender: Any) {
    }
    
    
    // model data
    var personData : Artist!
    var urlData : String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Artist"
        
        // populate outlets with model data
        personImageView.image = UIImage(named: personData.image)
        personLabel.text = personData.name
        
        personImageView.layer.cornerRadius = 16
        personImageView.layer.masksToBounds = true  // Keeps the image rounded

        print("Artist Image Container Frame: \(artistImageContainerView.frame)")
        
        // Apply shadow to the UIView container instead
        artistImageContainerView.layer.shadowColor = UIColor.init(red: 0.290, green: 0.290, blue: 0.447, alpha: 1.0).cgColor
//        artistImageContainerView.layer.shadowColor = UIColor.init(red: 74.0, green: 74.0, blue: 114.0, alpha: 0.0).cgColor
        artistImageContainerView.layer.shadowOpacity = 0.7
        artistImageContainerView.layer.shadowRadius = 15
        artistImageContainerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        artistImageContainerView.layer.masksToBounds = false  // Ensures shadow is visible outside
        
        
        let urlData = URL(string: personData.songUrl) ?? URL(string: "https://www.google.com/")
                
        let webURLRequest = URLRequest(url: urlData!)
            
        songWebView.load(webURLRequest)
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"{
            // Get the new view controller using segue.destination.
            let destinationController = segue.destination as! DetailsViewController
            
            // Pass the selected object to the new view controller.
            destinationController.personData = self.personData
        }
    }
    

}
