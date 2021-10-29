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
                    systemImage: "x.circle"
                )
                
                Section("Text") {
                    link(
                        EalaWoruldText(),
                        title: "Hello World",
                        systemImage: "hand.wave"
                    )
                    
                    link(
                        CustomFontView(),
                        title: "Custom Font",
                        systemImage: "f.cursive"
                    )
                    
                    link(
                        TextFrameView(string: sample),
                        title: "Text Frame",
                        systemImage: "character.textbox"
                    )
                    
                    link(
                        NoClipTextVerticalSimplified(string: sample),
                        title: "NoClipVSimple",
                        systemImage: "arrow.up.arrow.down.square"
                    )
                    
                    link(
                        NoClipTextHorizontalSimplified(string: sample),
                        title: "NoClipHSimple",
                        systemImage: "arrow.left.arrow.right.square"
                    )
                    
                    link(
                        Text(sample)
                            .font(font)
                            .noClipSingleLine(clipExtension: .all(20))
                            .border(.pink),
                        title: "NoClipTextSingleLine",
                        systemImage: "rectangle.and.arrow.up.right.and.arrow.down.left"
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
                        systemImage: "text.justifyleft"
                    )
                    
                    link(
                        EdgeCaseTester(text: "jjff"),
                        title: "EdgeCaseTester",
                        systemImage: "a.magnify"
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
                        systemImage: "quote.bubble"
                    )
                    
                    link(
                        OldEnglishIPASpeech(),
                        title: "Old English IPA Speech",
                        systemImage: "scroll"
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
        .colorScheme(.dark)
        .accentColor(.hotPink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
