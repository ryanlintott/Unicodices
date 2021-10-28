//
//  NoClipTextSingleLineSimplified.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-26.
//

import SwiftUI

struct NoClipTextSingleLineSimplified: View {
    let text: String
    let fontName: String = Junius.regular.rawValue
    let fontSize: CGFloat = 80
    
    // Character width equals fontSize
    let emSpace = "\u{2003}"
    
    var body: some View {
        Text(emSpace + text + emSpace)
            .font(.custom(fontName, fixedSize: fontSize))
            .baselineOffset(fontSize)
            .alignmentGuide(.lastTextBaseline) { d in
                d[.lastTextBaseline] - fontSize
            }
            .lineLimit(1)
            .padding(.bottom, -fontSize)
            .padding(.horizontal, -fontSize)
    }
}

struct NoClipTextSingleLineSimplified_Previews: PreviewProvider {
    static let text = "wrāþ-scræf"
    
    static var previews: some View {
        VStack(spacing: 20) {
            Text(text)
                .font(.custom(Junius.regular.rawValue, fixedSize: 70))
                .border(.pink)
        
            NoClipTextSingleLineSimplified(text: text)
                .border(.pink)
        }
    }
}
