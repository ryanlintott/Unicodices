//
//  NoClipTextHorizontalSimplified.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct NoClipTextHorizontalSimplified: View {
    let string: String
    let fontName: String = Junius.regular.rawValue
    let fontSize: CGFloat = 70
    
    // Character width equals fontSize
    let emSpace = "\u{2003}"
    
    var body: some View {
        Text(emSpace + string + emSpace)
            .font(.custom(fontName, fixedSize: fontSize))
            .padding(.horizontal, -fontSize)
            .border(.pink)
    }
}

struct NoClipTextHorizontalSimplified_Previews: PreviewProvider {
    static var previews: some View {
        NoClipTextHorizontalSimplified(string: "wrāþ-scræf")
            

        // Multiline text doesn't work
        NoClipTextHorizontalSimplified(string: "wrāþ\nscræf")
    }
}
