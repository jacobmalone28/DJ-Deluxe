//
//  SingleStationView.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 11/1/24.
//

import SwiftUI

struct SingleStationView: View {
    
    let station: Station
    
    func joinAllGenres() -> String {
        station.genres.map { $0.rawValue }.joined(separator: ", ")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.blue)
                    Text("🎵").font(.title)
                }
                VStack(alignment: .leading) {
                    Text(station.name)
                        .font(.headline)
                    Text("with \(station.hosts[0].name)")
                    Text(joinAllGenres())
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "info.circle")
                        .imageScale(.large)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .font(.caption)
    }
}

#Preview {
    SingleStationView(station: Station.exampleStation)
}
