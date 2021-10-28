//
//  NoClipTextJunicode.swift
//  Wordhord
//
//  Created by Ryan Lintott on 2021-04-26.
//

import SwiftUI

struct NoClipTextJunicode: View {
    let text: String
    let fontSize: CGFloat
    let relativeTo: Font.TextStyle
    let lineLimit: Int
    let minimumScaleFactor: CGFloat
    
    let fontName: String = Junius.regular.rawValue

    var lineSpacing: CGFloat {
        fontSize / 10
    }
    
    var allowsMultiline: Bool {
        lineLimit > 1
//            && (text.contains(" ") || text.contains("-"))
    }
    
    var leadingClipExtension: CGFloat {
        if allowsMultiline == false {
            switch text.first {
            case "Ǣ", "ʃ":
                return fontSize * 0.15
            default:
                break
            }
        }
        return 0
    }
    
    var leadingExtension: String {
        leadingClipExtension > 0 ? "\u{00a0}" : ""
    }
    
    var trailingClipExtension: CGFloat {
        switch text.last {
        case "f", "ʃ":
            return fontSize * 0.15
        default:
            return 0
        }
    }
    
    var trailingExtension: String {
        trailingClipExtension > 0 ? "\u{00a0}" : ""
    }
    
    var bottomClipExtension: CGFloat {
        fontSize * 0.3
    }
    
    var isAllowingTightening: Bool {
        !allowsMultiline || lineLimit == 1
    }

    var body: some View {
        Text(leadingExtension + text + trailingExtension)
            .baselineOffset(bottomClipExtension)
            .minimumScaleFactor(allowsMultiline ? 1 : minimumScaleFactor)
            .lineLimit(allowsMultiline ? lineLimit : 1)
            .allowsTightening(isAllowingTightening)
            .alignmentGuide(.lastTextBaseline) { d in
                d[.lastTextBaseline] - bottomClipExtension
            }
            .alignmentGuide(.firstTextBaseline) { d in
                d[.lastTextBaseline]
            }
            .padding(.leading, -leadingClipExtension)
            .padding(.trailing, -trailingClipExtension)
            .padding(.bottom, -bottomClipExtension)
            .font(.custom(Junius.regular.rawValue, size: fontSize, relativeTo: relativeTo))
            // This modifier prevents view heights randomly going to zero for some unknown reason
            .frame(minHeight: fontSize)
    }
}

struct NoClipTextJunicode_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                NoClipTextJunicode(text: "Hello World", fontSize: 40, relativeTo: .largeTitle, lineLimit: 1, minimumScaleFactor: 0.5)
                
                NoClipTextJunicode(text: "Hello\nWorld", fontSize: 40, relativeTo: .largeTitle, lineLimit: 2, minimumScaleFactor: 1)
                
                NoClipTextJunicode(text: "Hello World", fontSize: 40, relativeTo: .largeTitle, lineLimit: 1, minimumScaleFactor: 0.5)
            }
            
            Spacer(minLength: 0)
        }
    }
}
