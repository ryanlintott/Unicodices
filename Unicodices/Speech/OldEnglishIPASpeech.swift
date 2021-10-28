//
//  OldEnglish.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-16.
//

import AVFoundation
import SwiftUI

struct OldEnglishIPASpeech: View {
    let synthesizer = AVSpeechSynthesizer()
    
    @State private var voiceID = "com.apple.ttsbundle.Daniel-compact"
    
    var voice: AVSpeechSynthesisVoice? {
        AVSpeechSynthesisVoice(identifier: voiceID)
    }
    
    @ViewBuilder func ipaWord(text: String, ipa: String) -> some View {
        if let voice = voice {
            HStack {
                Button(text) {
                    synthesizer.speak(text, voice: voice)
                }
                
                Spacer(minLength: 0)
                
                Button(ipa) {
                    synthesizer.speakIPA(ipa, voice: voice)
                }
            }
            .buttonStyle(.borderless)
        }
    }
    
    var body: some View {
        Form {
            VoicePicker(languagePrefix: "en", voiceID: $voiceID)
            
            Group {
                ipaWord(text: "Ēalā, Woruld!", ipa: "ˈeːa-laː ˈwɔ-rʌld")
                ipaWord(text: "þurh-lāð", ipa: "ˈθʌrx-ˌlaːθ")
                ipaWord(text: "ǣ-lǣte", ipa: "ˈæː-ˌlæː-tə")
            }
            .font(.title)
        }
    }
}


struct OldEnglish_Previews: PreviewProvider {
    static var previews: some View {
        OldEnglishIPASpeech()
    }
}
