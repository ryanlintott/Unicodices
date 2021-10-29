//
//  SpeakEasy.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import AVFoundation
import SwiftUI

struct SpeakEasy: View {
    let synthesizer = AVSpeechSynthesizer()
    let text: String
    
    var body: some View {
        Button(text) {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = .init(language: "en-GB")
            /// Speak
            synthesizer.speak(utterance)
        }
    }
}

struct SpeakEasy_Previews: PreviewProvider {
    static var previews: some View {
        SpeakEasy(text: "Hello, World!")
    }
}
