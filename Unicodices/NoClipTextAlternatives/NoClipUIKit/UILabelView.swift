//
//  UILabelView.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2020-10-22.
//

import SwiftUI

struct UILabelView: UIViewRepresentable {
    typealias UIViewType = UILabel
    
    var text: String
    var font: UIFont
    
    func makeUIView(context: Context) -> UIViewType {
        let uiView = UIViewType()
        uiView.text = text
        uiView.font = font
        uiView.numberOfLines = 1
//        uiView.clipsToBounds = false
//        uiView.bounds = CGRect(origin: CGPoint(x: -1000, y: -1000), size: CGSize(width: 4000, height: 4000))

        return uiView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = text
    }
}

struct UILabelView_Previews: PreviewProvider {
    static var previews: some View {
        UILabelView(text: "wrāþ-scræf", font: UIFont(name: Junius.regular.rawValue, size: 70)!)
            .fixedSize()
            .previewLayout(.sizeThatFits)
            .border(.pink)
            .padding(20)
    }
}
