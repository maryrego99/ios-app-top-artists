

import UIKit

class PeopleTableViewController: UITableViewController {
    
    // model data
    var artistsData : TopArtists!
    var filteredArtists: [Artist] = []
    var isSearching = false

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "TopArtists"
        
        // init model data
        artistsData = TopArtists(xmlFile: "artists.xml")
        searchBar.delegate = self
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = UIColor.init(red: 0.118, green: 0.118, blue: 0.180, alpha: 1.0)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return isSearching ? filteredArtists.count : artistsData.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtistTableViewCell
        
        // get the cell data from peopleData
        let personData = isSearching ? filteredArtists[indexPath.row] : artistsData.artist(index: indexPath.row)

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

extension PeopleTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredArtists = []
        } else {
            isSearching = true
            filteredArtists = artistsData.allArtists().filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        isSearching = false
        tableView.reloadData()
    }
}
