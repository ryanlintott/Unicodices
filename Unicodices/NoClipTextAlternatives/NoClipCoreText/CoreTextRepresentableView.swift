//
//  CoreTextRepresentableView.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-11-15.
//

import SwiftUI

struct CoreTextRepresentableView: UIViewRepresentable {
    
    let string: String
    let font: UIFont
    let color: UIColor
    
    func makeUIView(context: Context) -> CoreTextLineUIView {
        return CoreTextLineUIView(string: string, font: font, color: color)
    }
    
    func updateUIView(_ uiView: CoreTextLineUIView, context: Context) {
        // In a real-world application, it would probably be smart to reuse the
        // CoreTextLineUIView by moving `string` and `font` into public properties.
    }
}

struct CoreTextRepresentableView_Previews: PreviewProvider {
    static var previews: some View {
        CoreTextRepresentableView(string: "jjff", font: UIFont(name: Junius.regular.rawValue, size: 80)!, color: .black)
            .background(
                Color.clear
                    .border(.red)
            )
    }
}
