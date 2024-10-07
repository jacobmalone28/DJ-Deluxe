//
//  SpotifyTrack.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 10/7/24.
//

import SwiftData

@Model
class SpotifyTrack {
    var id: String
    var title: String
    var artist: String
    var albumName: String
    var spotifyURI: String
    
    init(id: String, title: String, artist: String, albumName: String, spotifyURI: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.albumName = albumName
        self.spotifyURI = spotifyURI
    }
}
