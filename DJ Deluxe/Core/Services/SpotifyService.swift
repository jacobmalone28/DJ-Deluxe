//
//  SpotifyService.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 10/7/24.
//

import Foundation
import SpotifyiOS

enum SpotifyAuthError: Error {
    case failedToInitialize
    case userCancelled
    case noInternet
    case unknown(Error)
}

class SpotifyService: NSObject, ObservableObject {
    static let shared = SpotifyService()
    
    @Published private(set) var isConnected = false
    @Published private(set) var authError: SpotifyAuthError?
    
    private var sessionManager: SPTSessionManager?
    
    private override init() {
        super.init()
        setupSpotify()
    }
    
    private func setupSpotify() {
        let configuration = SPTConfiguration(clientID: SpotifyConstants.clientID,
                                            redirectURL: SpotifyConstants.redirectURL)
        sessionManager = SPTSessionManager(configuration: configuration, delegate: self)
    }
    
    func connect() {
        authError = nil  // Reset any previous errors
        let scopes: SPTScope = [.streaming, .userLibraryRead, .playlistReadPrivate]
        sessionManager?.initiateSession(with: scopes,
                                       options: .default,
                                       campaign: "your_campaign_name")
    }
    
    func disconnect() {
        sessionManager?.session = nil
        isConnected = false
    }
}

extension SpotifyService: SPTSessionManagerDelegate {
    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        DispatchQueue.main.async {
            self.isConnected = true
            self.authError = nil
        }
    }
    
    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
        DispatchQueue.main.async {
            self.isConnected = false
            
            if let sptError = error as? SpotifyAuthError {
                switch sptError {
                case .userCancelled:
                    self.authError = .userCancelled
                case .noInternet:
                    self.authError = .noInternet
                default:
                    self.authError = .unknown(error)
                }
            } else {
                self.authError = .unknown(error)
            }
        }
    }
    
    func sessionManager(manager: SPTSessionManager, didRenew session: SPTSession) {
        print("Session renewed")
    }
}
