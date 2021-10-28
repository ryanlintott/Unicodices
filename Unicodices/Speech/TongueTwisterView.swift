//
//  TongueTwisterView.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-15.
//

import AVFoundation
import SwiftUI

struct TongueTwisterView: View {
    static let idPrefix = "com.apple."
    let synthesizer = AVSpeechSynthesizer()
    let allVoices = AVSpeechSynthesisVoice.speechVoices()
        .sorted { lhs, rhs in
            lhs.language <= rhs.language &&
            lhs.identifier < rhs.identifier
        }

    @State private var voiceID = Self.idPrefix + "ttsbundle.Daniel-compact"
    
    var voice: AVSpeechSynthesisVoice? {
        AVSpeechSynthesisVoice(identifier: voiceID)
    }
    
    var body: some View {
        Form {
            Section("Voice") {
                Picker(voiceID, selection: $voiceID) {
                    ForEach(allVoices, id: \.identifier) { voice in
                        Text(voice.language + "  |  " + voice.identifier .replacingOccurrences(of: Self.idPrefix, with: ""))
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                if let voice = voice {
                    Text(voice.identifier)
                        .font(.footnote)
                }
            }
            
            if let voice = voice {
                ForEach(TongueTwisterType.allCases) { tongueTwisterType in
                    Section(tongueTwisterType.description) {
                        ForEach(tongueTwisterType.examples, id: \.self) { example in
                            Button(example) {
                                synthesizer.speak(example, voice: voice)
                            }
                        }
                    }
                }
            } else {
                Text("Voice not found")
            }
        }
    }
}

struct TongueTwisterView_Previews: PreviewProvider {
    static var previews: some View {
        TongueTwisterView()
    }
}
