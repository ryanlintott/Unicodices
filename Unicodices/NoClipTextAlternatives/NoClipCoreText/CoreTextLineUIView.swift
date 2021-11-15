//
//  CoreTextLineUIView.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-11-15.
//

import UIKit

// MARK: - CoreTextLineUIView

final class CoreTextLineUIView: UIView {
    
    /// Private Properties
    ///
    private let lineBounds: CGRect
    private let line: CTLine
    private let padding: CGFloat = 1
    
    /// init(string:font:color:)
    ///
    init(string: String, font: UIFont, color: UIColor) {
        
        // You can apply whatever attributes make sense here. Note that the labels font and
        // font color need to get applied here because they become part of the CTLine.
        let attributes: [NSAttributedString.Key : Any] = [
            .font : font,
            .foregroundColor : color
        ]
        
        let attributedString = NSAttributedString(string: string, attributes: attributes)
        
        // This CoreText method accepts various options for computing a desired bounds.
        // Check the documentation and see how the options affect the returned value.
        self.line = CTLineCreateWithAttributedString(attributedString)
        let glyphPathBounds = CTLineGetBoundsWithOptions(self.line, [.useGlyphPathBounds])
        self.lineBounds = CGRect(
            x: glyphPathBounds.minX - padding,
            y: glyphPathBounds.minY - padding,
            width: glyphPathBounds.width + (padding * 2),
            height: glyphPathBounds.height + (padding * 2)
        )
        
        super.init(frame: .zero)
        
        // Disable opacity so that SwiftUI modifiers like backgroundColor work as expected.
        self.isOpaque = false
        
        // Increase hugging priority so that this view is only as large as it needs to be.
        // Adjust this accordingly if you desire different resizing behavior.
        self.setContentHuggingPriority(.required, for: .horizontal)
        self.setContentHuggingPriority(.required, for: .vertical)
    }
    
    /// init(coder:)
    ///
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// intrinsicContentSize
    ///
    override var intrinsicContentSize: CGSize {
        return CGSize(width: lineBounds.width, height: lineBounds.height)
    }
    
    /// draw(rect:)
    ///
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        // Save the CGContext's current state.
        context.saveGState()
        
        // Invert the CGContext to a CoreText friendly origin in the lower-left corner.
        let transform = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: lineBounds.height)
        context.concatenate(transform)
        
        // Move the context's pen position based on the line's computed bounds and origin.
        context.textPosition.x -= lineBounds.origin.x
        context.textPosition.y -= lineBounds.origin.y
        
//        context.textPosition.x += padding
//        context.textPosition.y += padding
        
        // Draw the CoreText line.
        CTLineDraw(line, context)
        
        // Restore the CGContext.
        context.restoreGState()
    }
}

