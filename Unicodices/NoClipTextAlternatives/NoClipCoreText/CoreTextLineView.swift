//
//  CoreTextLineView.swift
//  Unicodices
//

import SwiftUI

// MARK: - CoreTextLineView

struct CoreTextLineView: View {
    
    /// Public Properties
    ///
    let font = UIFont(name: Junius.regular.rawValue, size: 60)!
    let textColor = UIColor.label
    let string: String
    
    /// body
    ///
    var body: some View {
        CoreTextRepresentableView(string: string, font: font, color: textColor)
            .background(
                Color.clear
                    .border(.pink)
            )
    }
}

// MARK: - Previews

struct CoreTextLineView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Normal Text Above")
            CoreTextLineView(string: "jjff")
            CoreTextLineView(string: "wrāþ-scræf")
            CoreTextLineView(string: "Ēalā, Woruld!")
            Text("Normal Text Below")
        }
    }
}
