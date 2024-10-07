//
//  SpotifyLoginView.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 10/7/24.
//
import SwiftUI

struct SpotifyLoginView: View {
    @StateObject private var spotifyService = SpotifyService.shared
    
    var body: some View {
        VStack {
            Text("Enhance Your Music Experience")
                .font(.title)
                .padding()
            
            if let error = spotifyService.authError {
                Text(errorMessage(for: error))
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: {
                if spotifyService.isConnected {
                    spotifyService.disconnect()
                } else {
                    spotifyService.connect()
                }
            }) {
                HStack {
                    Image(systemName: spotifyService.isConnected ? "music.note.circle.fill" : "music.note.circle")
                    Text(spotifyService.isConnected ? "Disconnect Spotify" : "Connect Spotify")
                }
                .padding()
                .background(spotifyService.isConnected ? Color.green : Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
    }
    
    private func errorMessage(for error: SpotifyAuthError) -> String {
        switch error {
        case .userCancelled:
            return "Authentication was cancelled"
        case .noInternet:
            return "No internet connection"
        case .failedToInitialize:
            return "Failed to initialize Spotify"
        case .unknown(let error):
            return "An error occurred: \(error.localizedDescription)"
        }
    }
}
