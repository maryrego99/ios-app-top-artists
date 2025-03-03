//
//  ArtistTableViewCell.swift
//  People Multi Screen
//
//  Created by Maryanne Rego on 3/3/25.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    private func setupUI() {
        artistImageView.layer.cornerRadius = artistImageView.frame.height / 2
        artistImageView.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
