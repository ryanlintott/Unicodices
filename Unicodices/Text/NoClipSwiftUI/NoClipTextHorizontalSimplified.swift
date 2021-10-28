//
//  NoClipTextHorizontalSimplified.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct NoClipTextHorizontalSimplified: View {
    let text: String
    let fontName: String = Junius.regular.rawValue
    let fontSize: CGFloat = 80
    
    // Character width equals fontSize
    let emSpace = "\u{2003}"
    
    var body: some View {
        Text(emSpace + text + emSpace)
            .font(.custom(fontName, fixedSize: fontSize))
            .padding(.horizontal, -fontSize)
            .border(.pink)
    }
}

struct NoClipTextHorizontalSimplified_Previews: PreviewProvider {
    static var previews: some View {
        NoClipTextHorizontalSimplified(text: "wrāþ-scræf")
            

        // Multiline text doesn't work
        NoClipTextHorizontalSimplified(text: "wrāþ-scræf\nwrāþ-scræf")
    }
}
