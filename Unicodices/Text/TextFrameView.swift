//
//  TextFrameView.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct TextFrameView: View {
    let string: String
    
    var body: some View {
        Text(string)
            .font(.custom("JuniusVF", size: 70))
            .border(.pink)
    }
}

struct TextFrameView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
//            TextFrameView(text: "Ēalā, Woruld!")
            TextFrameView(string: "wrāþ-scræf")
//            TextFrameView(text: "wrāþ-scræf\nwrāþ-scræf")
//            TextFrameView(text: "wrāþ-scræf wrāþ-scræf")
//            TextFrameView(text: "wrāþ-scræf\nwrāþ-scræf ")
        }
    }
}
