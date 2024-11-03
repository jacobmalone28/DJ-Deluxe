//
//  HostDetailsView.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 11/2/24.
//

import SwiftUI

struct HostDetailsView: View {
    
    var host: Host
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
            VStack{
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(host.name)
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(host.desc)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .frame(height: 300)
        Form {
            Section(header: Text("Host Personality")) {
                HStack {
                    Text("Chattiness")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(host.chatiness)")
                }
                HStack {
                    Text("Humor Level")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(host.humorLevel)")
                }
                HStack {
                    Text("Energy")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(host.energy)")
                }
                HStack {
                    Text("Friendliness")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(host.friendliness)")
                }
                HStack {
                    Text("Randomness")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(host.randomness)")
                }
            }
            Section(header: Text("Other Details")) {
                        
                HStack {
                    Text("Voice")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(host.voice.rawValue)
                }
            }
        }
        
        Spacer()
    }
}

#Preview {
    HostDetailsView(host: Host.exampleHost)
}
