//
//  AVSpeechSynthesizer+speakIPA.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import AVFoundation

extension AVSpeechSynthesizer {
    /// Speaks an IPA string out loud
    /// - Parameters:
    ///   - ipaString: String using IPA notation
    ///   - voiceIdentifier: Voice to use
    ///   - willSpeak: Runs just before speech and includes exact string to be spoken.
    func speakIPA(_ ipaString: String, voice: AVSpeechSynthesisVoice) {
        let mutableAttributedString = NSMutableAttributedString(string: ipaString)
        
        /// Define a range that's the length of the ipaString
        let range = NSString(string: ipaString).range(of: ipaString)
        /// Get the pronunciationKey
        let pronunciationKey = NSAttributedString.Key(rawValue: AVSpeechSynthesisIPANotationAttribute)
        /// Do not confuse with .accessibilitySpeechIPANotation
        
        mutableAttributedString.setAttributes([pronunciationKey: ipaString], range: range)

        let utterance = AVSpeechUtterance(attributedString: mutableAttributedString)

        utterance.voice = voice
        
        // Pausing first is safer and may prevent bugs
        self.pauseSpeaking(at: .immediate)
        // Stop speaking otherwise utterances with queue
        self.stopSpeaking(at: .immediate)
        
        print("speakIPA: \(ipaString) voice: \(voice.identifier)")
        
        self.speak(utterance)
    }
}
