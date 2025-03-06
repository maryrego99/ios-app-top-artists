//
//  StorageManager.swift
//  People Multi Screen
//
//  Created by Maryanne Rego on 3/4/25.
//

import Foundation

class StorageManager {
    static let favoritesKey = "favoriteArtists"

    static func saveFavorites(_ favorites: [String]) {
        UserDefaults.standard.set(favorites, forKey: favoritesKey)
    }

    static func getFavorites() -> [String] {
        print("favorites: ")
        print(UserDefaults.standard.stringArray(forKey: favoritesKey) ?? [])
        return UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
    }
}
