//
//  String+extensions.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2020-11-06.
//

import SwiftUI

extension StringProtocol {
    func size(using font: UIFont) -> CGSize {
        return String(self).size(using: font)
    }
}

extension String {
    func size(using font: UIFont) -> CGSize {
        (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
    
    func splitMultiline(by separator: Character = " ", font: UIFont, maxWidth: CGFloat) -> [String] {
        /// If the whole string fits on one line, return it
        guard self.size(using: font).width > maxWidth else {
            return [self]
        }
        
        var parts = self.split(separator: separator)
        
        var multiline = [String]()
        
        while parts.count > 0 {
            /// Remove one part at a time from start to end
            let part = String(parts.removeFirst())
            
            /// Create a line using the last line + this part
            let line = [multiline.last, part].compactMap({$0}).joined(separator: String(separator))
            
            /// Check the size to see if it fits
            if line.count > 0 && line.size(using: font).width <= maxWidth {
                if multiline.count > 0 {
                    multiline[multiline.endIndex - 1] = line
                } else {
                    multiline.append(line)
                }
            } else {
                /// Split long words into multiple lines if it doesn't fit on one line
                let wordParts = String(part).splitMultilineByCharacter(font: font, maxWidth: maxWidth)
                
                /// Add new line(s)
                multiline += wordParts
            }
        }
        return multiline.map { String($0) }
    }
    
    func splitMultilineByCharacter(font: UIFont, maxWidth: CGFloat) -> [String] {
        guard self.size(using: font).width > maxWidth else {
            return [self]
        }
        
        var characters = Array(self).map({String($0)})
        var multiline = [characters.removeFirst()]
        var index = 0
        
        while characters.count > 0 {
            let character = characters.removeFirst()
            
            let line = multiline[index] + character
            
            if line.size(using: font).width <= maxWidth {
                multiline[index] = line
            } else {
                multiline.append(character)
                index += 1
            }
        }
        return multiline
    }
    
    var usingNonLineBreakingHyphens: String {
        self.replacingOccurrences(of: SpecialCharacter.hyphen, with: SpecialCharacter.nonBreakingHyphen)
    }
    
    func splittingClosestToMidpoint(by separator: Character = " ") -> [String] {
        var parts = self.split(separator: separator)
        var firstHalf = [Substring]()
        var secondHalf = [Substring]()
        while parts.count > 0 {
            if firstHalf.joined(separator: String(separator)).count <= secondHalf.joined(separator: String(separator)).count {
                firstHalf.append(parts.removeFirst())
            } else {
                secondHalf.append(parts.removeLast())
            }
        }
        return [firstHalf.joined(separator: String(separator)), secondHalf.reversed().joined(separator: String(separator))].filter({ $0.count > 0})
    }
    
    func changingBlankToNil() -> String? {
        self == "" ? nil : self
    }

    func droppingSuffix<S: StringProtocol>(_ string: S) -> String {
        guard self.hasSuffix(string) else { return String(self) }
        return String(self.dropLast(string.count))
    }
    
    func droppingPrefix<S: StringProtocol>(_ string: S) -> String {
        guard self.hasPrefix(string) else { return String(self) }
        return String(self.dropFirst(string.count))
    }
    
    func replacingSuffixOccurrence(of string: String, with replacement: String) -> String {
        guard self.hasSuffix(string) else { return self }
        return self.droppingSuffix(string).appending(replacement)
    }
    
    func replacingPrefixOccurrence(of string: String, with replacement: String) -> String {
        guard self.hasPrefix(string) else { return self }
        return replacement.appending(self.droppingPrefix(string))
    }
}

