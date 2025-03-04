//
//  DetailsViewController.swift
//  Multi Screen App
//
//  Created by Sabin Tabirca on 11/02/2025.
//

import UIKit

class DetailsViewController: UIViewController {
    //MARK: -Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var popularSongs: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var webInfoButton: UIButton!
    @IBAction func webInfoAction(_ sender: Any) {
    }
    
    // model data
    var personData : Artist!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"

        // populate the labels with personData
        nameLabel.text  = personData.name
        genreLabel.text = personData.genre
        popularSongs.text = personData.popularSongs
        urlLabel.text   = personData.url
        
        webInfoButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        webInfoButton.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
        
    }
    
    @objc func buttonPressed() {
        UIView.animate(withDuration: 0.1) {
            self.webInfoButton.alpha = 0.7
        }
    }

    @objc func buttonReleased() {
        UIView.animate(withDuration: 0.1) {
            self.webInfoButton.alpha = 1.0
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2"{
            // Get the new view controller using segue.destination.
            let destinationController = segue.destination as! WebViewController
            
            // Pass the selected object to the new view controller.
            destinationController.urlData = self.personData.url
        }
    }
    

}
