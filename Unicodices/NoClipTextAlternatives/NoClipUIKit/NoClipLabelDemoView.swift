//
//  NoClipTextDemoView.swift
//  SwiftUITextDemo
//
//  Created by Ryan Lintott on 2020-10-27.
//

import SwiftUI

struct NoClipLabelDemoView: View {
    let exampleText = "ʃǢglyƿf"
    let fontName = Junius.bold.rawValue
    let fontSize: CGFloat = 60
    var font: Font { .custom(fontName, size: fontSize) }
    var uiFont: UIFont { UIFont(name: fontName, size: fontSize)! }
    
    var body: some View {
        VStack {
            Text("Problem: Fonts clip in SwiftUI")
                .font(.system(size: 32))
                .bold()
                .underline()

            HStack(alignment: .top) {
                Group {
                    VStack(spacing: 10) {
                        Text("SwiftUI")
                        Text(exampleText)
                            .font(font)
                            .border(Color.blue, width: 1)
                        Text("Can't extend clipping frame.")
                        Text(
                            """
                            .padding
                            .clipShape
                            .frame
                            """
                        )
                        .strikethrough()
                    }
                    
                    VStack(spacing: 10) {
                        Text("UILabel")
                        UILabelView(text: exampleText, font: uiFont)
                            .fixedSize()
                            .border(Color.blue, width: 1)
                        Text("Still can't extend clipping frame!")
                        Text(
                            """
                            .clipsToBounds
                            .bounds
                            """
                        )
                        .strikethrough()
                    }
                    
                }
                .frame(width: 250)
            }
            .padding(.vertical)
            
            VStack(spacing: 10) {
                Text("Wordaround: NoClipText")
                    .font(.system(size: 32))
                    .bold()
                    .underline()

                Text("Subclass of UILabel")
                
                NoClipUILabelView(text: exampleText, font: uiFont, color: .black, clipExtension: .all(10))
                    .fixedSize()
                    .border(Color.blue, width: 1)
                
                Text(
                    """
                    ✓ Works in SwiftUI
                    ✓ Custom clipping extension sizes for each edge
                    ✓ Frame keeps existing size (use padding if needed)
                    """
                )
                
                Text("Github Gist Here: ")
                Text("bit.ly/nocliptext")
                    .font(.system(size: 24))
                    .foregroundColor(.blue)
            }
            
        }
    }
}

struct NoClipTextDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NoClipLabelDemoView()
            .previewLayout(.sizeThatFits)
    }
}
