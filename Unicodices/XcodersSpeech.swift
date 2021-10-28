//
//  XcodersSpeech.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-28.
//

import SwiftUI

struct XcodersSpeech: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
        
            VStack(spacing: 20) {
                Text("Unicodices")
                    .font(.system(size: 70, weight: .black, design: .rounded))
                    .padding(.bottom, 20)
                
                Text("Edge cases in")
                    .font(.system(size: 30))
                
                HStack(alignment: .lastTextBaseline) {
                    Text("SwiftUI")
                    
                    Text("Text").foregroundColor(.hotPink)
                        .font(.custom("Zapfino", size: 40))
                        .italic()
                        .border(Color.hotPink)
                }
                
                Text("and")
                    .font(.system(size: 30))
                
                HStack(spacing: 0) {
                    Text("AV")
                    SpeakEasy1(text: "Speech")
                        .foregroundColor(.turquoise)
                    Text("Synthesis")
                }
                
                
                SpeakEasy1(text: "Live tonight at 8:30 PST")
                    .padding()
                    .background(Color.turquoise.cornerRadius(20))
                    .frame(maxWidth: 300)
            }
            .font(.system(size: 40))
        }
        .foregroundColor(.white)
    }
}

struct XcodersSpeech_Previews: PreviewProvider {
    static var previews: some View {
        XcodersSpeech()
    }
}
