//
//  NoClipUILabelView.swift
//  SwiftUITextDemo
//
//  Created by Ryan Lintott on 2020-10-27.
//

import SwiftUI

struct NoClipUILabelView: UIViewRepresentable {
    typealias UIViewType = NoClipUILabel
    
    let text: String
    let font: UIFont
    let textAlignment: NSTextAlignment?
    let color: UIColor
    let clipExtension: EdgeSizes

    static let defaultTextAlignment: NSTextAlignment = .left
    
    init(text: String, font: UIFont, textAlignment: NSTextAlignment? = nil, color: Color, clipExtension: EdgeSizes) {
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
        self.color = UIColor(color)
        self.clipExtension = clipExtension
    }
    
    func makeUIView(context: Context) -> UIViewType {
        let uiView = UIViewType()
        uiView.text = text
        uiView.font = font
        uiView.textAlignment = textAlignment ?? Self.defaultTextAlignment
        uiView.numberOfLines = 0
        uiView.lineBreakMode = .byWordWrapping
        uiView.textColor = color
        uiView.clipExtension = clipExtension

        return uiView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
        if uiView.font != font {
            uiView.font = font
        }
        if uiView.textAlignment != textAlignment {
            uiView.textAlignment = textAlignment ?? Self.defaultTextAlignment
        }
        if uiView.textColor != color {
            uiView.textColor = color
        }
        if uiView.clipExtension != clipExtension {
            uiView.clipExtension = clipExtension
        }
    }
}

struct NoClipUILabelView_Previews: PreviewProvider {
    static let font: UIFont = UIFont(name: Junius.regular.rawValue, size: 70)!
    
    static var previews: some View {
        Group {
            NoClipUILabelView(text: "wrāþ-scræf", font: font, color: .black, clipExtension: .zero)
                .fixedSize()
            
            // extension on all edges
            NoClipUILabelView(text: "wrāþ-scræf", font: font, color: .black, clipExtension: .all(20))
                .fixedSize()
            
            // extension on some edges
            NoClipUILabelView(text: "wrāþ-scræf", font: font, color: .black, clipExtension: .init(top: 0, left: 0, bottom: 10, right: 0))
                .fixedSize()
            
            // No automatic word wrapping
            NoClipUILabelView(text: "wrāþ-scræf wrāþ-scræf", font: font, color: .black, clipExtension: .all(20))
                .frame(maxWidth: 400)
                .fixedSize()
        }
        .previewLayout(.sizeThatFits)
        .border(.pink)
        .padding(20)
        // Dynamic font sizing has no effect
//        .environment(\.sizeCategory, .extraExtraExtraLarge)
    }
}
