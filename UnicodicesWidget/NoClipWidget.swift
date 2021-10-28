//
//  NoClipWidget.swift
//  UnicodicesWidget
//
//  Created by Ryan Lintott on 2021-10-26.
//

import WidgetKit
import SwiftUI

struct NoClipWidget: View {
    var body: some View {
        Text("jjff")
            .font(.custom("zapfino", size: 40))
            .border(.pink)
    }
}

struct NoClipWidget_Previews: PreviewProvider {
    static var previews: some View {
        NoClipWidget()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
