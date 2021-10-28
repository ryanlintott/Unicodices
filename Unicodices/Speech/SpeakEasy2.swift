//
//  SpeakEasy2.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-15.
//

import AVFoundation
import SwiftUI

struct SpeakEasy2: View {
    let synthesizer = AVSpeechSynthesizer()
    let text: String
    let voice: AVSpeechSynthesisVoice?
    
    var body: some View {
        Form {
            Section("Voice ID") {
                Text(voice?.identifier ?? "nil")
                Text(voice?.language ?? "nil")
            }
            Button(text) {
                let utterance = AVSpeechUtterance(string: text)
                utterance.voice = voice

                synthesizer.speak(utterance)
            }
        }
    }
}

struct SpeakEasy2_Previews: PreviewProvider {
    static var previews: some View {
        SpeakEasy2(text: "Hello, World!", voice: .init(language: "en-GB"))
    }
}
