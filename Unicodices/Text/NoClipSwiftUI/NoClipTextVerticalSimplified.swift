//
//  NoClipTextVerticalSimplified.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct NoClipTextVerticalSimplified: View {
    let string: String
    let fontSize: CGFloat = 70
    var bottomExtension: CGFloat {
        fontSize * 0.15
    }
    
    var body: some View {
        Text(string)
            .font(.custom(Junius.regular.rawValue, fixedSize: fontSize))
            .baselineOffset(bottomExtension)
            .padding(.bottom, -bottomExtension)
            .alignmentGuide(.lastTextBaseline) { d in
                d[.lastTextBaseline] - bottomExtension
            }
//            .lineSpacing(-bottomExtension) // This doesn't work
            .border(.pink)
    }
}

struct NoClipTextVerticalSimplified_Previews: PreviewProvider {
    static var previews: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("a")
                .font(.system(size: 60))
            NoClipTextVerticalSimplified(string: "wrāþ-scræf")
        }
           
        
        VStack(spacing: 20) {
            Text("wrāþ-scræf\nwrāþ-scræf")
                .font(.custom(Junius.regular.rawValue, fixedSize: 70))
                .border(.pink)

            NoClipTextVerticalSimplified(string: "wrāþ-scræf\nwrāþ-scræf")
        }
        
    }
}
