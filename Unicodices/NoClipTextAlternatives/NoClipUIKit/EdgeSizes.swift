//
//  EdgeSizes.swift
//  SwiftUITextDemo
//
//  Created by Ryan Lintott on 2020-10-27.
//

import SwiftUI

struct EdgeSizes: Equatable {
    let top: CGFloat
    let left: CGFloat
    let bottom: CGFloat
    let right: CGFloat
    
    init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
    
    init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self.top = vertical
        self.left = horizontal
        self.bottom = vertical
        self.right = horizontal
    }
    
    init(_ all: CGFloat) {
        self.top = all
        self.left = all
        self.bottom = all
        self.right = all
    }
    
    static let zero = EdgeSizes(0)
    
    static func all(_ size: CGFloat) -> EdgeSizes {
        EdgeSizes(size)
    }
    
    static func vertical(_ size: CGFloat) -> EdgeSizes {
        EdgeSizes(vertical: size)
    }
    
    static func horizontal(_ size: CGFloat) -> EdgeSizes {
        EdgeSizes(horizontal: size)
    }
}
