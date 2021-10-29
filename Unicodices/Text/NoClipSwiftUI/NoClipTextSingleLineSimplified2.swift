//
//  NoClipTextSingleLineSimplified2.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-28.
//

import SwiftUI

struct NoClipTextSingleLineSimplified2: View {
    static let horizontalTextCount = 20
    static let horizontalText = Text(Array<String>(repeating: SpecialCharacter.emSpace, count: horizontalTextCount).joined())

    let text: Text
    let clipExtension: CGFloat

    var horizontalPaddingText: Text {
        Self.horizontalText
            .font(.system(size: clipExtension / CGFloat(Self.horizontalTextCount)))
    }
    
    var body: some View {
        (horizontalPaddingText + text + horizontalPaddingText)
            .baselineOffset(clipExtension)
            .alignmentGuide(.lastTextBaseline) { d in
                d[.lastTextBaseline] - (2 * clipExtension)
            }
            .lineLimit(1)
            .padding(.bottom, -clipExtension)
            .padding(.horizontal, -clipExtension)
    }
}

extension Text {
    func noClipSingleLine(clipExtension: CGFloat) -> some View {
        NoClipTextSingleLine(text: self, clipExtension: .all(clipExtension))
    }
}

struct NoClipTextSingleLineSimplified2_Previews: PreviewProvider {
    static let string = "wrāþ-scræf"
    
    static var previews: some View {
        Text(string).font(.custom(Junius.regular.rawValue, size: 70))
            .noClipSingleLine(clipExtension: 20)
    }
}
