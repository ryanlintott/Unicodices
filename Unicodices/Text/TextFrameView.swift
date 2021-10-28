//
//  TextFrameView.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct TextFrameView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.custom("JuniusVF", size: 70))
            .border(.pink)
    }
}

struct TextFrameView_Previews: PreviewProvider {
    static var previews: some View {
        TextFrameView(text: "wrāþ-scræf")
        
        VStack(spacing: 10) {
            TextFrameView(text: "wrāþ-scræf\nwrāþ-scræf")
            TextFrameView(text: "wrāþ-scræf wrāþ-scræf")
            TextFrameView(text: "wrāþ-scræf\nwrāþ-scræf ")
        }
    }
}
