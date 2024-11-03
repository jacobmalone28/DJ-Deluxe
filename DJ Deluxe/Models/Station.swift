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
    @Attribute(.unique) var name: String
    var timestamp: Date
    var hosts: [Host]
    var genres: [GenreSelection]
    var icon: String = "🎵"
    
    init(name: String, hosts: [Host], genres: [GenreSelection]) {
        self.name = name
        self.timestamp = Date.now
        self.hosts = hosts
        self.genres = genres
        self.icon = "🎵"
    }
    
    static var exampleStation = Station(
        name: "Test Station",
        hosts: [Host.exampleHost],
        genres: [
            GenreSelection(mainGenre: .rock, subGenre: .some(.hardRock)),
            GenreSelection(mainGenre: .electronic, subGenre: .some(.deepHouse))
        ]
    )
}

// New struct to represent a genre selection with optional subgenre
struct GenreSelection: Codable {
    var mainGenre: RadioGenre
    var subGenre: SubGenre?
    
    var displayName: String {
        if let subGenre = subGenre {
            return "\(mainGenre.rawValue) - \(subGenre.name)"
        }
        return mainGenre.rawValue
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
    
    // Get available subgenres for this main genre
    var availableSubGenres: [SubGenre] {
        SubGenre.allCases.filter { $0.parentGenre == self }
    }
    
    static var allGenres: [RadioGenre] {
        return self.allCases
    }
}

enum SubGenre: String, CaseIterable, Codable {
    // Rock subgenres
    case hardRock = "Hard Rock"
    case softRock = "Soft Rock"
    case progressiveRock = "Progressive Rock"
    case psychedelicRock = "Psychedelic Rock"
    
    // Electronic subgenres
    case deepHouse = "Deep House"
    case techHouse = "Tech House"
    case ambient = "Ambient"
    case dubstep = "Dubstep"
    case drumAndBass = "Drum and Bass"
    
    // Hip Hop subgenres
    case trap = "Trap"
    case oldSchool = "Old School"
    case conscious = "Conscious"
    case gangsta = "Gangsta"
    
    // Jazz subgenres
    case bebop = "Bebop"
    case smoothJazz = "Smooth Jazz"
    case fusion = "Fusion"
    case swing = "Swing"
    
    // Metal subgenres
    case heavyMetal = "Heavy Metal"
    case blackMetal = "Black Metal"
    case deathMetal = "Death Metal"
    case thrashmetal = "Thrash Metal"
    
    // Pop subgenres
    case synthPop = "Synth Pop"
    case kPop = "K-Pop"
    case latinPop = "Latin Pop"
    case artPop = "Art Pop"
    
    // Property to define which main genre each subgenre belongs to
    var parentGenre: RadioGenre {
        switch self {
        case .hardRock, .softRock, .progressiveRock, .psychedelicRock:
            return .rock
        case .deepHouse, .techHouse, .ambient, .dubstep, .drumAndBass:
            return .electronic
        case .trap, .oldSchool, .conscious, .gangsta:
            return .hipHop
        case .bebop, .smoothJazz, .fusion, .swing:
            return .jazz
        case .heavyMetal, .blackMetal, .deathMetal, .thrashmetal:
            return .metal
        case .synthPop, .kPop, .latinPop, .artPop:
            return .pop
        }
    }
    
    
    var name: String {
        return self.rawValue
    }
}
