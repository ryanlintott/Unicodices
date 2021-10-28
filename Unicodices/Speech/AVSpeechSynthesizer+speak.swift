//
//  AVSpeechSynthesizer+speak.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-15.
//

import AVFoundation

extension AVSpeechSynthesizer {
    /// Creates a basic utterance and speaks.
    /// - Parameters:
    ///   - string: String to speak
    ///   - voice: A non-nil voice must be provided
    func speak(_ string: String, voice: AVSpeechSynthesisVoice) {
        let utterance = AVSpeechUtterance(string: string)
        
        utterance.voice = voice
        
        // Pausing first is safer and may prevent bugs
        self.pauseSpeaking(at: .immediate)
        // Stop speaking otherwise utterances with queue
        self.stopSpeaking(at: .immediate)

        print("speak: \(string) voice: \(voice.identifier)")

        self.speak(utterance)
    }
}
