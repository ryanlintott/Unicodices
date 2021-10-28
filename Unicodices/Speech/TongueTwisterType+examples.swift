//
//  TongueTwisterType+examples.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-16.
//

import Foundation

extension TongueTwisterType {
    var examples: [String] {
        switch self {
        case .varyingVowels:
            return [
                "Thou thought through the tough trough though."
            ]
        case .homonym:
            return [
                "I live for Saturday Night Live.",
                "I have read the read me.",
                "I read the read me.",
                "A bass can't play a bass.",
                "Tie a bow on the bow.",
                "The wind has started to wind down.",
                "Lead me to the lead weight.",
                "I refuse this refuse.",
                "A minute is quite minute.",
                "Is it appropriate to appropriate.",
                "I went to the console to console them.",
                "Are you content with the content?",
                "Delegate to the delegate.",
                "What a deliberate way to deliberate.",
                "I can entrance with my entrance.",
                "Separate these separate objects.",
                "I can produce the produce.",
                "Let's alternate to the alternate."
            ]
        case .contentious:
            return [
                "gif",
                "tomato",
                "caramel",
                "jaguar",
                "vase",
                "mauve"
            ]
        case .name:
            return [
                "iPhone",
                "M1 Processor",
                "AVSpeechSynthesis",
                "Xcoders"
            ]
        case .numeric:
            return [
                "Nov 5, 1955",
                "1955-11-05",
                "11-5-1955",
                "05-11-1955",
                "555-123-4567",
                "1/2",
                "$3.50",
                "£10.50",
                "802.11b"
            ]
        case .symbolic:
            return [
                "1 + 2",
                "Fish + chips",
                "@ryanlintott",
                ":) ;) :P",
                "#SwiftUI",
                "$500"
            ]
        }
    }
}
