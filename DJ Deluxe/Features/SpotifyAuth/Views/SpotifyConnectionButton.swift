//
//  SpotifyConnectionButton.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 10/7/24.
//
import SwiftUI

struct SpotifyConnectionButton: View {
    @ObservedObject var viewModel: SpotifyAuthViewModel
    
    var body: some View {
        Button(action: {
            if viewModel.isConnected {
                viewModel.disconnect()
            } else {
                viewModel.connect()
            }
        }) {
            HStack {
                Image(systemName: viewModel.isConnected ? "music.note.circle.fill" : "music.note.circle")
                Text(viewModel.isConnected ? "Disconnect Spotify" : "Connect Spotify")
            }
            .padding()
            .background(viewModel.isConnected ? Color.green : Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
