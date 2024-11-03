//
//  HostCreateView.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 11/2/24.
//

import SwiftUI

struct HostCreateView: View {
    @State private var hostName = ""
    @State private var hostDescription = ""
    @State private var selectedVoice = Voice.bigVoice
    
    @State private var chattiness = 0.5
    @State private var humorLevel = 0.5
    @State private var energy = 0.5
    @State private var friendliness = 0.5
    @State private var randomness = 0.5
    
    let nameLimit = 30
    let descLimit = 120
    
    @State var randomize = false
    
    var body: some View {
        Form {
            Section(header: Text("Host Details")) {
                TextField("Host Name", text: Binding(
                    get: { hostName },
                    set: { newValue in
                        if newValue.count <= nameLimit {
                            hostName = newValue
                        } else {
                            hostName = String(newValue.prefix(nameLimit))
                        }
                    }
                ))
                Picker(selectedVoice.rawValue, selection: $selectedVoice) {
                    ForEach(0..<Voice.allCases.count) { index in
                        Text(Voice.allCases[index].rawValue)
                    }
                }
            }
            
            Section(header: Text("Host Description")) {
                VStack(alignment: .leading) {
                    TextEditor(text: Binding(
                        get: { hostDescription },
                        set: { newValue in
                            if newValue.count <= descLimit {
                                hostDescription = newValue
                            } else {
                                hostDescription = String(newValue.prefix(descLimit))
                            }
                        }
                    ))
                    .frame(height: 100)
                    
                    HStack {
                        Spacer()
                        Text("\(hostDescription.count) /\(descLimit)")
                            .font(.caption)
                        
                    }
                }
            }
            
            Section(header: HStack {
                Text("Host Attributes")
                Spacer()
                Button(){
                    randomize.toggle()
                    chattiness = Double.random(in: 0...5)
                    humorLevel = Double.random(in: 0...5)
                    energy = Double.random(in: 0...5)
                    friendliness = Double.random(in: 0...5)
                    randomness = Double.random(in: 0...5)
                }label: {
                    Image(systemName: "dice.fill")
                    
                }
                .symbolEffect(.wiggle, value: randomize)
            }) {
                // Chattiness
                HStack {
                    Text("Chattiness").padding(.trailing)
                    Spacer()
                    Text("\(chattiness, specifier: "%.2f")").padding(.leading)
                }
                Slider(value: $chattiness, in: 0...5)
                
                // Humor Level
                HStack {
                    Text("Humor Level").padding(.trailing)
                    Spacer()
                    Text("\(humorLevel, specifier: "%.2f")").padding(.leading)
                }
                Slider(value: $humorLevel, in: 0...5)
                
                // Energy
                HStack {
                    Text("Energy").padding(.trailing)
                    Spacer()
                    Text("\(energy, specifier: "%.2f")").padding(.leading)
                }
                Slider(value: $energy, in: 0...5)
                
                // Friendliness
                HStack {
                    Text("Friendliness").padding(.trailing)
                    Spacer()
                    Text("\(friendliness, specifier: "%.2f")").padding(.leading)
                }
                Slider(value: $friendliness, in: 0...5)
                
                // Randomness
                HStack {
                    Text("Randomness").padding(.trailing)
                    Spacer()
                    Text("\(randomness, specifier: "%.2f")").padding(.leading)
                }
                Slider(value: $randomness, in: 0...5)
            }
        }
        .navigationTitle("Create Host")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    // Save the host
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        HostCreateView()
    }
}
