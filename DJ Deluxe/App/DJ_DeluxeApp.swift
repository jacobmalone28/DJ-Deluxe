//
//  DJ_DeluxeApp.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 10/2/24.
//

import SwiftUI
import SwiftData

@main
struct DJ_DeluxeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Station.self,
            Host.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SpotifyLoginView()
        }
        .modelContainer(sharedModelContainer)
    }
}

#Preview(body: {
    StationsView()
})
