//
//  TongueTwister.swift
//  Unicodices
//
//  Created by Ryan Lintott on 2021-10-16.
//

import Foundation

enum TongueTwisterType: String, CaseIterable, Identifiable {
    var id: String {
        rawValue
    }
    
    case varyingVowels
    case homonym
    case contentious
    case name
    case numeric
    case symbolic
    
    var description: String {
        rawValue
            .replacingOccurrences(of: "([A-Z])", with: " $0", options: .regularExpression, range: rawValue.range(of: rawValue))
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized
    }
}
