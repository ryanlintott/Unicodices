//
//  NoClipTextMultiLine.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct NoClipTextMultiLine: View {
    let multiLineText: String
    let fontName: String
    let relativeTo: Font.TextStyle
    let maxWidth: CGFloat
    @ScaledMetric var fontSize: CGFloat

    init(
        _ text: String,
        fontName: String,
        fontSize: CGFloat,
        relativeTo: Font.TextStyle = .body,
        maxWidth: CGFloat
    ) {
        self.multiLineText = text
        self.fontName = fontName
        self.relativeTo = relativeTo
        self.maxWidth = maxWidth
        /// Generate scaled font size
        self._fontSize = ScaledMetric(wrappedValue: fontSize, relativeTo: relativeTo)
    }
    
    var font: UIFont {
        UIFont(name: fontName, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    var body: some View {
        MultiLineTextView(multiLineText, font: font, maxWidth: maxWidth) { index, text in
            text
                .noClipSingleLine(clipExtension: .all(20))
                .minimumScaleFactor(1)
        }
    }
}

struct NoClipTextMultiLine_Previews: PreviewProvider {
    static let text = "Ēalā, Woruld! wrāþ-scræf fēðe-mund þurh-lāð"
    
    static var previews: some View {
        WidthReader(alignment: .center) { width in
            NoClipTextMultiLine(text, fontName: Junius.regular.rawValue, fontSize: 80, maxWidth: width)
                .border(.pink)
        }
//        .environment(\.sizeCategory, .extraExtraExtraLarge)
    }
}
