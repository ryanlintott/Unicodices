//
//  NoClipUILabel.swift
//  SwiftUITextDemo
//
//  Created by Ryan Lintott on 2020-10-27.
//

import SwiftUI

class NoClipUILabel: UILabel {
    static let defaultClipExtension: EdgeSizes = .all(10)
    
    var clipExtension: EdgeSizes
    
    var top: CGFloat { clipExtension.top }
    var left: CGFloat { clipExtension.left }
    var bottom: CGFloat { clipExtension.bottom }
    var right: CGFloat { clipExtension.right }
    var width: CGFloat { left + right }
    var height: CGFloat { bottom + top }
    
    required init(clipExtension: EdgeSizes = defaultClipExtension) {
        self.clipExtension = clipExtension
        super.init(frame: CGRect.zero)
    }

    override init(frame: CGRect) {
        clipExtension = Self.defaultClipExtension
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        clipExtension = Self.defaultClipExtension
        super.init(coder: aDecoder)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)))
    }

    override var alignmentRectInsets: UIEdgeInsets {
        return .init(top: top, left: left, bottom: bottom, right: right)
    }

    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += width
        size.height += height

        return size
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let fixedSize = CGSize(width: size.width - width, height: size.height - height)
        let sizeWithoutExtension = super.sizeThatFits(fixedSize)

        return CGSize(width: sizeWithoutExtension.width + width,
                      height: sizeWithoutExtension.height + height)
    }

}
