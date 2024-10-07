//
//  Host.swift
//  DJ Deluxe
//
//  Created by Jacob Malone on 10/7/24.
//

import Foundation
import SwiftData
import AVFoundation

@Model
final class Host {
    @Attribute(.unique) var name: String
    var voice: String
    var personality: [String: Float]
    var desc: String
    var img: URL
    
    init(name: String, voice: String, personality: [String : Float], desc: String, img: URL) {
        self.name = name
        self.voice = voice
        self.personality = personality
        self.desc = desc
        self.img = img
    }
}
