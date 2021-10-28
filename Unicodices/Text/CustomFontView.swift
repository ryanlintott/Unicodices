//
//  CustomFontView.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-27.
//

import SwiftUI

struct CustomFontView: View {
    var body: some View {
        Text("Ēalā, Woruld!")
            .font(.custom("JuniusVF", size: 70))
    }
}

struct CustomFontView_Previews: PreviewProvider {
    static var previews: some View {
        CustomFontView()
    }
}
