//
//  NoClipTextSingleLine.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-26.
//

import SwiftUI

struct NoClipTextSingleLine: View {
    static let horizontalTextCount = 20
    static let horizontalText = Text(Array<String>(repeating: SpecialCharacter.emSpace, count: horizontalTextCount).joined())

    let text: Text
    let clipExtension: EdgeInsets
    
    var verticalExtension: CGFloat {
        clipExtension.top + clipExtension.bottom
    }
    
    var leadingPaddingText: Text {
        Self.horizontalText
            .font(.system(size: clipExtension.leading / CGFloat(Self.horizontalTextCount)))
    }
    
    var trailingPaddingText: Text {
        Self.horizontalText
            .font(.system(size: clipExtension.trailing / CGFloat(Self.horizontalTextCount)))
    }
    
    var body: some View {
        (leadingPaddingText + text + trailingPaddingText)
            .baselineOffset(verticalExtension)
            .alignmentGuide(.lastTextBaseline) { d in
                d[.lastTextBaseline] - verticalExtension
            }
            .lineLimit(1)
            .padding(.bottom, -verticalExtension)
            .padding(.leading, -clipExtension.leading)
            .padding(.trailing, -clipExtension.trailing)
    }
}

extension Text {
    func noClipSingleLine(clipExtension: EdgeInsets) -> some View {
        NoClipTextSingleLine(text: self, clipExtension: clipExtension)
    }
    
    func noClipSingleLine(clipExtension: CGFloat) -> some View {
        NoClipTextSingleLine(text: self, clipExtension: .all(clipExtension))
    }
}

struct NoClipTextSwiftUI_Previews: PreviewProvider {
    static let text = "wrāþ-scræf"
    static let font = Font.custom(Junius.regular.rawValue, size: 70)
    
    static var previews: some View {
        Text(text)
            .font(font)
            .noClipSingleLine(clipExtension: .all(20))
            .border(.pink)
        
        ZStack {
            Group {
                Text(text)
                    .font(font)
                    .noClipSingleLine(clipExtension: .all(20))
                    .foregroundColor(.pink)
                
                Text(text)
                    .font(font)
                    .lineLimit(1)
                    
            }
            .border(.pink)
        }
        .environment(\.sizeCategory, .extraExtraExtraLarge)
    }
}
