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
    var voice: Voice
    var chatiness: Float = 2.5
    var humorLevel: Float = 2.5
    var energy: Float = 2.5
    var friendliness: Float = 2.5
    var randomness: Float = 2.5
    var desc: String
    var img: URL
    
    init(name: String, voice: Voice, desc: String, img: URL) {
        self.name = name
        self.voice = voice
        self.desc = desc
        self.img = img
    }
    
    static var exampleHost = Host(name: "John Doe", voice: .bigVoice, desc: "Just a test DJ", img: URL(filePath: "ah"))
}

enum Voice: String, CaseIterable, Codable {
    case bigVoice = "Big Voice"
    case smallVoice = "Small Voice"
    case deepVoice = "Deep Voice"
    case highVoice = "High Voice"
    case roboticVoice = "Robotic Voice"
    case alienVoice = "Alien Voice"
    case whisperVoice = "Whisper Voice"
    case loudVoice = "Loud Voice"
    case softVoice = "Soft Voice"
    case fastVoice = "Fast Voice"
    case slowVoice = "Slow Voice"
    case normalVoice = "Normal Voice"
}

struct PersonalityTrait: Identifiable {
    let id: String
    let name: String
    let value: Float

    init(key: String, value: Float) {
        self.id = key
        self.name = key
        self.value = value
    }
}
