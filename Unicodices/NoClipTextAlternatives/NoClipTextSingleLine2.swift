//
//  NoClipTextSingleLine2.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-26.
//

import SwiftUI

struct NoClipTextSingleLine2: View {
    let text: String
    let fontName: String
    let fontSize: CGFloat
    let relativeTo: Font.TextStyle
    let lineLimit: Int = 1
    
    var horizontalClipExtension: CGFloat {
        fontSize * 0.15
    }
    
    let nonBreakingSpace = SpecialCharacter.nonBreakingSpace
    
    var bottomClipExtension: CGFloat {
        fontSize * 0.3
    }

    var body: some View {
        Text(nonBreakingSpace + text + nonBreakingSpace)
            .baselineOffset(bottomClipExtension)
            .lineLimit(1)
            .alignmentGuide(.lastTextBaseline) { d in
                d[.lastTextBaseline] - bottomClipExtension
            }
            .padding(.horizontal, -horizontalClipExtension)
            .padding(.bottom, -bottomClipExtension)
            .font(.custom(fontName, size: fontSize, relativeTo: relativeTo))
            // This modifier prevents view heights randomly going to zero for some unknown reason
            .frame(minHeight: fontSize)
    }
}

struct NoClipTextSingleLine2_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text(verbatim: "wrāþ-scræf")
                .font(.custom(Junius.regular.rawValue, size: 40, relativeTo: .largeTitle))
            
            NoClipTextSingleLine2(text: "wrāþ-scræf", fontName: Junius.regular.rawValue, fontSize: 40, relativeTo: .largeTitle)
        }
    }
}

