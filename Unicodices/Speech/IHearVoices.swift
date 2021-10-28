//
//  IHearVoices.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-16.
//

import AVFoundation
import SwiftUI

struct IHearVoices: View {
    let synthesizer = AVSpeechSynthesizer()
    let allVoices = AVSpeechSynthesisVoice.speechVoices()
        .sorted { lhs, rhs in
            lhs.language <= rhs.language &&
            lhs.identifier < rhs.identifier
        }
    
    @Binding var text: String
    
    var body: some View {
        Form {
            Section("Text") {
                TextField("Text", text: $text)
            }
            
            Section("Voice") {
                ForEach(allVoices, id: \.identifier) { voice in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(voice.language)
                            
                            Spacer()
                            
                            Button {
                                synthesizer.speak(text, voice: voice)
                            } label: {
                                Image(systemName: "play.fill")
                                    .padding(3)
                            }
                        }
                        .font(.title3)
                        
                        Text(voice.identifier)
                    }
                }
            }
        }
    }
}

struct IHearVoices_Previews: PreviewProvider {
    static var previews: some View {
        IHearVoices(text: .constant("Hello, World!"))
    }
}
