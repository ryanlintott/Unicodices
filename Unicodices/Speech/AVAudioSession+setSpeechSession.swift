//
//  AVAudioSession+setSpeechSession.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-09-05.
//

import AVFoundation

public extension AVAudioSession {
    /// Sets audioSession to play on mute, pause other spoken audio and duck anything else.
    func setSpeechSession() throws {
        try self.setCategory(.playback, options: [
            .interruptSpokenAudioAndMixWithOthers,
            .duckOthers
        ])
    }
}
