//
//  Station.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 10/7/24.
//

import Foundation
import SwiftData

@Model
final class Station {
    @Attribute(.unique) var name: String // name of the radio station
    
    var timestamp: Date
    var hosts: [Host]
    var genres: [RadioGenre]
    
    init(name: String, timestamp: Date, hosts: [Host], genres: [RadioGenre]) {
        self.name = name
        self.timestamp = timestamp
        self.hosts = hosts
        self.genres = genres
    }
}

enum RadioGenre: String, CaseIterable, Codable {
    case pop = "Pop"
    case rock = "Rock"
    case hipHop = "Hip Hop"
    case electronic = "Electronic"
    case country = "Country"
    case jazz = "Jazz"
    case classical = "Classical"
    case alternative = "Alternative"
    case rnb = "R&B"
    case reggae = "Reggae"
    case blues = "Blues"
    case folk = "Folk"
    case metal = "Metal"
    case punk = "Punk"
    case indie = "Indie"
    case disco = "Disco"
    case house = "House"
    case techno = "Techno"
    case trance = "Trance"
    case latin = "Latin"
    case world = "World"
    case oldies = "Oldies"
    case easyListening = "Easy Listening"
    case christian = "Christian"
    case gospel = "Gospel"

    //Example of using CaseIterable to get an array of all cases:
    static var allGenres: [RadioGenre] {
        return self.allCases
    }
}
