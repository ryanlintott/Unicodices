//
//  SpeakEasyIPA.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import AVFoundation
import SwiftUI

struct SpeakEasyIPA: View {
    let synthesizer = AVSpeechSynthesizer()
    let text: String
    let voice: AVSpeechSynthesisVoice?
    
    var body: some View {
        if let voice = voice {
            Button(text) {
                synthesizer.speakIPA(text, voice: voice)
            }
        }
    }
}

struct SpeakEasyIPA_Previews: PreviewProvider {
    static var previews: some View {
        SpeakEasyIPA(text: "ˈæː-ˌlæː-tə", voice: .init(identifier: "com.apple.ttsbundle.Daniel-compact"))
    }
}
