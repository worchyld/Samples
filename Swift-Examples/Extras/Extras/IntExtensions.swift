//
//  IntExtensions.swift
//  Extras
//
//  Created by Amarjit on 10/06/2024.
//

import Foundation

// Int extensions

extension Int {
    static func randomInt(withMax: Int) -> Int {
        let maximum = UInt32(withMax)
        return 1 + Int(arc4random_uniform(maximum))
    }
}

extension Int {
    var isPositive: Bool {
        return (self > 0)
    }
    var isNegative: Bool {
        return (self < 0)
    }
}

extension Int {
    func clamp(low: Int, high: Int) -> Int {
        if (self > high) {
            // if we are higher than the upper bound, return the upper bound
            return high
        } else if (self < low) {
            // if we are lower than the lower bound, return the lower bound
            return low
        }
        return self
    }
}

public extension Int {
    var ordinalFormat: String? {
        let number: NSNumber = NSNumber(integerLiteral: self)
        let cache = NumberFormatCache.ordinalFormat
        return cache.string(from: number)
    }
}
