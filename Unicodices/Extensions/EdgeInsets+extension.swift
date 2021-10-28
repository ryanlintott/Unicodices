//
//  EdgeInsets+extension.swift
//  FontTester
//
//  Created by Ryan Lintott on 2021-03-02.
//

import SwiftUI

extension EdgeInsets {
    static func all(_ size: CGFloat) -> EdgeInsets {
        EdgeInsets(top: size, leading: size, bottom: size, trailing: size)
    }
}
