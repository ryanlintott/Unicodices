//
//  VoicePicker.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI
import AVFoundation

struct VoicePicker: View {
    static let idPrefix = "com.apple."
    @Binding var voiceID: String
    let languagePrefix: String
    var allVoices: [AVSpeechSynthesisVoice] {
        AVSpeechSynthesisVoice
            .speechVoices()
            .filter {
                $0.language.prefix(languagePrefix.count) == languagePrefix
            }
            .sorted(by: {
                $0.identifier < $1.identifier
            })
    }

    var voice: AVSpeechSynthesisVoice? {
        AVSpeechSynthesisVoice(identifier: voiceID)
    }
    
    init(languagePrefix: String = "", voiceID: Binding<String>) {
        self.languagePrefix = languagePrefix
        self._voiceID = voiceID

    }

    var body: some View {
        Section("Voice") {
            Picker("Voice", selection: $voiceID) {
                ForEach(allVoices, id: \.identifier) { voice in
                    Text(voice.language + "  |  " + voice.identifier.replacingOccurrences(of: Self.idPrefix, with: ""))
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            if let voice = voice {
                Text(voice.identifier)
                    .font(.footnote)
            }
        }
    }
}

struct VoicePicker_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            VoicePicker(voiceID: .constant("com.apple.ttsbundle.Daniel-compact"))
        }
    }
}
