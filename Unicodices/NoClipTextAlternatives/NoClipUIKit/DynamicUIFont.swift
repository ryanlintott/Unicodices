//
//  DynamicUIFont.swift
//  Wordhord
//
//  Created by Ryan Lintott on 2020-11-12.
//

import SwiftUI

struct DynamicUIFont<Content: View>: View {
    let font: UIFont
    @ScaledMetric var fontSize: CGFloat
    
    let content: (UIFont) -> Content
    
    var scaledFont: UIFont {
        font.withSize(fontSize)
    }
    
    init(_ font: UIFont, relativeTo: Font.TextStyle, content: @escaping (UIFont) -> Content) {
        self.font = font
        self._fontSize = ScaledMetric(wrappedValue: font.pointSize, relativeTo: relativeTo)
        self.content = content
    }
    
    var body: some View {
        content(scaledFont)
    }
}

struct DynamicUIFont_Previews: PreviewProvider {
    static var previews: some View {
        DynamicUIFont(UIFont(name: "Cochin", size: 14)!, relativeTo: .body) { font in
            Text("\(font.pointSize)")
        }
        .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
    }
}
