//
//  SpeakEasy.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct SpeakEasy: View {
    let text: String
    
    var body: some View {
        Button(text) {
            /// Speak
        }
    }
}

struct SpeakEasy_Previews: PreviewProvider {
    static var previews: some View {
        SpeakEasy(text: "Hello, World!")
    }
}
