//
//  StationCreateView.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 11/2/24.
//

import SwiftUI

struct StationCreateView: View {
    
    @State private var stationName = ""
    @State private var selectedSubgenres : [SubGenre] = []
    @State private var selectedHosts : [Host] = []
//    @State private var selectedSongs : [Song] = []
    @State private var selectedIcon = "🎵"
    
    var body: some View {
        Form {
            HStack {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.blue)
                    Text("🎵").font(.title)
                }
                VStack(alignment: .leading) {
                    Text(stationName)
                        .font(.headline)
                    if selectedHosts.count > 0 {
                        Text("with \(selectedHosts[0].name)")
                    }
                    else {
                        Spacer()
                    }
                    if selectedSubgenres.count > 0 {
                        Text(selectedSubgenres.map { $0.name }.joined(separator: ", "))
                            .foregroundColor(.secondary)
                    }
                    else {
                        Spacer()
                    }
                }
                .padding(.vertical)
                
                Spacer()
            }
            
            Section(header: Text("Station Details")) {
                HStack {
                        TextField("Station Name", text: $stationName)
                            
                }
                Picker("Genres", selection: .constant(0)) {
                    ForEach(RadioGenre.allCases, id: \.self) { genre in
                        Picker(genre.rawValue, selection: .constant(0)) {
                            ForEach(genre.availableSubGenres, id: \.self) {subGenre in
                                Text(subGenre.name)
                            }
                        }
                    }
                }
            }
            Section(header: Text("Hosts")) {
                NavigationLink(destination: HostCreateView()) {
                    Label("Add Host", systemImage: "person.badge.plus")
                }
            }
            
            Section(header: Text("Example Songs")) {
                NavigationLink(destination: Text("Example Songs")) {
                    Label("Add Songs", systemImage: "music.note.list")
                }
            }
        }
        .navigationTitle("Create Station")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        
        StationCreateView()
    }
}
