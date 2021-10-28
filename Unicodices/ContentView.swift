//
//  ContentView.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-14.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var text = "Hello, World!"
    let sample = "wrāþ-scræf"
    let fontName = Junius.regular.rawValue
    let fontSize: CGFloat = 80
    var font: Font {
        Font.custom(fontName, size: fontSize)
    }
    
    func link<T: View>(_ destination: T, title: String, systemImage: String) -> some View {
        NavigationLink(destination: destination.navigationTitle(title)) {
            Label(title, systemImage: systemImage)
        }
    }
    
    init() {
        /// Ensure speech audio plays properly
        try? AVAudioSession.sharedInstance().setSpeechSession()
    }
    
    var body: some View {
        NavigationView {
            Form {
                link(
                    XcodersSpeech(),
                    title: "Xcoders",
                    systemImage: "textformat.abc"
                )
                
                Section("Text") {
                    link(
                        EalaWoruldText(),
                        title: "Hello World",
                        systemImage: "textformat.abc"
                    )
                    
                    link(
                        CustomFontView(),
                        title: "Custom Font",
                        systemImage: "textformat.abc"
                    )
                    
                    link(
                        TextFrameView(text: sample),
                        title: "Text Frame",
                        systemImage: "textformat.abc"
                    )
                    
                    link(
                        NoClipTextVerticalSimplified(text: sample),
                        title: "NoClipVSimple",
                        systemImage: "textformat.abc"
                    )
                    
                    link(
                        NoClipTextHorizontalSimplified(text: sample),
                        title: "NoClipHSimple",
                        systemImage: "textformat.abc"
                    )
                    
                    link(
                        Text(sample)
                            .font(font)
                            .noClipSingleLine(clipExtension: .all(20))
                            .border(.pink),
                        title: "NoClipTextSingleLine",
                        systemImage: "textformat.abc"
                    )
                    
                    link(
                        WidthReader { width in
                            NoClipTextMultiLine(
                                sample,
                                fontName: fontName,
                                fontSize: fontSize,
                                maxWidth: width
                            )
                        },
                        title: "NoClipTextMultiLine",
                        systemImage: "textformat.abc"
                    )
                    
                    link(
                        EdgeCaseTester(text: "jjff"),
                        title: "EdgeCaseTester",
                        systemImage: "textformat.abc"
                    )
                }
                
                Section("Speech") {
                    link(
                        SpeakEasy1(text: text),
                        title: "SpeakEasy1",
                        systemImage: "bubble.left"
                    )
                    
                    link(
                        SpeakEasy2(text: text, voice: .init(language: "en-GB")),
                        title: "SpeakEasy2",
                        systemImage: "character.bubble"
                    )
                    
                    link(
                        IHearVoices(text: $text),
                        title: "I Hear Voices",
                        systemImage: "bubble.left.and.bubble.right"
                    )
                    
                    link(
                        EalaWoruldSpeech(),
                        title: "Hello World Speech",
                        systemImage: "bubble.left.and.bubble.right"
                    )
                    
                    link(
                        OldEnglishIPASpeech(),
                        title: "Old English IPA Speech",
                        systemImage: "bubble.left.and.bubble.right"
                    )
                    
                    link(
                        TongueTwisterView(),
                        title: "TongueTwisters",
                        systemImage: "exclamationmark.bubble"
                    )
                }
            }
            .navigationTitle("Unicodices")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
