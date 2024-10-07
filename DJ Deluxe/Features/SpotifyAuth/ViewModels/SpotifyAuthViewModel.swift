//
//  SpotifyAuthViewModel.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 10/7/24.
//

import SwiftUI

@MainActor
class SpotifyAuthViewModel: ObservableObject {
    @Published private(set) var isConnected: Bool
    private let spotifyService: SpotifyService
    
    init(spotifyService: SpotifyService = .shared) {
        self.spotifyService = spotifyService
        self.isConnected = spotifyService.isConnected
    }
    
    func connect() {
        spotifyService.connect()
    }
    
    func disconnect() {
        spotifyService.disconnect()
    }
}
