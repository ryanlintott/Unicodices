//
//  EdgeCaseSnippets.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-26.
//

import SwiftUI

struct EdgeCaseTester: View {
    let text: String
    let size: CGFloat = 70
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Group {
                    Text(text)
                        .font(.custom("Zapfino", size: size / 2))
                    
                    Text(text)
                        .font(.custom("Cochin", size: size))
                    
                    Text(text)
                        .font(.system(size: size, weight: .black, design: .serif))
                        .italic()
                    
                    Text(text)
                        .font(.system(size: size))
                        .italic()
                    
                    Text(text)
                        .font(.system(size: size, weight: .regular, design: .rounded))
                    
                    Text(text)
                        .font(.system(size: size, design: .serif))
                    
                    Text(text)
                        .font(.system(size: size))
                }
                .background(
                    Color.clear
                        .border(.pink)
                )
            }
        }
    }
}

struct EdgeCaseSnippets_Previews: PreviewProvider {
    static var previews: some View {
//        EdgeCaseTester(text: "Ēalā, Woruld")
//        EdgeCaseTester(text: "wrāþ-scræf")
//        EdgeCaseTester(text: "fēðe-mund")
        EdgeCaseTester(text: "jjff")
            .padding(5)
    }
}
