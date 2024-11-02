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
                    SingleStationView(station: station)
                }
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("My Stations")
            
        }
        .searchable(text: $search)
    }
    
    
    
    
}

#Preview(body: {
    StationsView()
})
