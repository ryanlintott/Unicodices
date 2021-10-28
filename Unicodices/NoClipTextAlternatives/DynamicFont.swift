//
//  DynamicFont.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-26.
//

import SwiftUI

struct DynamicFont<Content: View>: View {
    @ScaledMetric var size: CGFloat
    
    let content: (CGFloat) -> Content

    init(size: CGFloat, relativeTo: Font.TextStyle = .body, content: @escaping (CGFloat) -> Content) {
        self._size = ScaledMetric(wrappedValue: size, relativeTo: relativeTo)
        self.content = content
    }
    
    var body: some View {
        content(size)
    }
}

struct DynamicFont_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFont(size: 14, relativeTo: .body) { size in
            Text("\(size)")
                .font(.custom("Cochin", fixedSize: size))
        }
        .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
    }
}
