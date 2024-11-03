//
//  StationsView.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 11/1/24.
//

import SwiftUI

struct StationsView : View{
    
    @State var search : String = ""
    
    
    let stations: [Station] = [Station.exampleStation]
    
    
    var body: some View{
        NavigationView {
            VStack {
                ForEach(stations) { station in
                    NavigationLink {
                        SingleStationView(station: station)
                    } label: {
                        SingleStationRow(station: station)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("My Stations")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: StationCreateView()) {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
        .searchable(text: $search)
        
    }
}

struct SingleStationRow: View {
    
    let station: Station
    
    func joinAllGenres() -> String {
        station.genres.map { $0.displayName }.joined(separator: ", ")
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
            }
        }
        .font(.caption)
    }
}


#Preview(body: {
    StationsView()
})
