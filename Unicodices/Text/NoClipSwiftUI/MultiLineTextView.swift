//
//  MultiLineTextView.swift
//  FontTester
//
//  Created by Ryan Lintott on 2021-03-02.
//

import SwiftUI

struct MultiLineTextView<Content: View>: View {
    let multiLine: [(Int, String)]
    let font: UIFont
    let alignment: HorizontalAlignment
    let spacing: CGFloat
    let content: (Int, Text) -> Content
    
    init(_ text: String, font: UIFont, alignment: HorizontalAlignment = .leading, spacing: CGFloat? = nil, maxWidth: CGFloat, @ViewBuilder content: @escaping (Int, Text) -> Content) {
        self.font = font
        self.alignment = alignment
        self.spacing = spacing ?? 0
        
        /// Split text into multiple lines
        let lines = text
            .splitMultiline(font: font, maxWidth: maxWidth)
        
        /// Make an array of lines with indicies
        multiLine = Array(zip(lines.indices, lines))
        
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(multiLine, id: \.0) { (index, text) in
                /// Wrap text in custom view
                content(index, Text(text).font(Font(font)))
            }
        }
    }
}

struct MultiLineTextView_Previews: PreviewProvider {
    static let text = "Ēalā, Woruld! wrāþ-scræf fēðe-mund þurh-lāð"
    static let font = UIFont(name: Junius.regular.rawValue, size: 80)!
    
    static var previews: some View {
        MultiLineTextView(text, font: font, maxWidth: 400) { index, text in
            text
                .border(.pink)
        }
    }
}
