//
//  TextLines.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct TextLines: View {
    let multiline: [(Int, String)]
    let font: UIFont
    
    init(_ text: String, font: UIFont, maxWidth: CGFloat) {
        self.font = font
        let lines = text
            .splitMultiline(font: font, maxWidth: maxWidth)
        multiline = Array(zip(lines.indices, lines))
    }
    
    var body: some View {
        ForEach(multiline, id: \.0) { (index, text) in
            Text(text).font(Font(font))
        }
    }
}

struct TextLines_Previews: PreviewProvider {
    static let text = "Ǣʃasdffasdfas dfdsad sfds"
    static let font = UIFont(name: Junius.regular.rawValue, size: 50)!
    
    static var previews: some View {
        VStack {
            TextLines(text, font: font, maxWidth: 200)
//                .singleLineNoClip(clipExtension: .all(10))
                .overlay(Rectangle().stroke().foregroundColor(.blue))
        }
    }
}
