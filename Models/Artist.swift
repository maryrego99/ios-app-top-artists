//
//  Artist.swift
//  Multi Screen App
//
//  Created by Maryanne Rego on 11/02/2025.
//

import Foundation

class Artist{
    // properties
    var name, genre, popularSongs, url, image : String
    
    // init
    init(name: String, genre: String, popularSongs: String, url: String, image: String) {
        self.name = name
        self.genre = genre
        self.popularSongs = popularSongs
        self.url = url
        self.image = image
    }
}
