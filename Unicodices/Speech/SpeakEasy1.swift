//
//  SpeakEasy1.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-15.
//

import AVFoundation
import SwiftUI

struct SpeakEasy1: View {
    let synthesizer = AVSpeechSynthesizer()
    let text: String
    
    var body: some View {
        Button(text) {
            synthesizer.speak(AVSpeechUtterance(string: text))
        }
    }
}

struct SpeakEasy1_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            SpeakEasy1(text: "Hello, World!")
            
            SpeakEasy1(text: "Ēalā, Woruld!")
            
            SpeakEasy1(text: "þurh-lāð")
            
            SpeakEasy1(text: "ǣ-lǣte")
        }
    }
}
