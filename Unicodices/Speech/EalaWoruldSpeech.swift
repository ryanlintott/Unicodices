//
//  EalaWoruldSpeech.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct EalaWoruldSpeech: View {
    var body: some View {
        VStack(spacing: 20) {
            SpeakEasy1(text: "Ēalā, Woruld!")
            
            SpeakEasy1(text: "þurh-lāð")
            
            SpeakEasy1(text: "ǣ-lǣte")
        }
        .font(.system(size: 70))
    }
}

struct EalaWoruldSpeech_Previews: PreviewProvider {
    static var previews: some View {
        EalaWoruldSpeech()
    }
}
