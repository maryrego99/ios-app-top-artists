//
//  PersonViewController.swift
//  Multi Screen App
//
//  Created by Sabin Tabirca on 11/02/2025.
//

import UIKit

class ArtistViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personLabel: UILabel!
    
    @IBAction func moreInfoAction(_ sender: Any) {
    }
    
    // model data
    var personData : Artist!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Artist"

        
        
        // populate outlets with model data
        personImageView.image = UIImage(named: personData.image)
        personLabel.text = personData.name
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
