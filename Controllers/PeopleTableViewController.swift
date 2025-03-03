

import UIKit

class PeopleTableViewController: UITableViewController {
    
    // model data
    var artistsData : TopArtists!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "TopArtists"
        
        // init model data
        artistsData = TopArtists(xmlFile: "artists.xml")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return artistsData.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtistTableViewCell
        
        // get the cell data from peopleData
        let personData = artistsData.artist(index: indexPath.row)

        // Configure the cell...
        cell.nameLabel.text = personData.name
        cell.genreLabel.text = personData.genre
        let imageName = (personData.image)
        if let image = UIImage(named: imageName) {
            cell.artistImageView.image = image
        } else {
            print("Image not found: \(imageName)")
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue0"{
            // Get the new view controller using segue.destination.
            let destinationController = segue.destination as! ArtistViewController
            
            // get the indexPath data to push
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let personData = artistsData.artist(index: indexPath!.row)
        
            
            // Pass the selected object to the new view controller.
            destinationController.personData = personData
        }
    }
   

}
