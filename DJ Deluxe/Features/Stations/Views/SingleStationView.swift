//
//  SingleStationView.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 11/1/24.
//

import SwiftUI

struct SingleStationView: View {
    let station: Station
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.blue)
            VStack {
                Spacer()
                HStack{
                    VStack(alignment: .leading) {
                        Text(station.name)
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(station.genres.map { $0.displayName }.joined(separator: ", "))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    Button {
                        print("Play")
                    } label: {
                        Image(systemName: "play.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .frame(alignment: .bottomLeading)
                }
            }
            .padding()
            
        }
        .frame(height: 300)
        Text("Hosted by")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Edge.Set(arrayLiteral: .leading, .top))
            .font(.subheadline)
        
        ForEach(station.hosts) { host in
            NavigationLink {
                HostDetailsView(host: host)
            } label: {
                SingleHostRow(host: host)
            }
            
            
        }
        Spacer()
    }
}

struct SingleHostRow: View {
    let host: Host
    
    var body: some View {
        NavigationLink {
            HostDetailsView(host: host)
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.blue)
                }
                VStack(alignment: .leading) {
                    Text(host.name)
                        .font(.headline)
                    Text(host.desc)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            
            .padding(.horizontal)
        }
                
    }
}


#Preview {
    NavigationView {
        SingleStationView(station: Station.exampleStation)
        Spacer()
    }
}
