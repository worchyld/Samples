//
//  StringExtensions.swift
//  Extras
//
//  Created by Amarjit on 10/06/2024.
//

import Foundation

// String extensions

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func cashFormat(_ amount: Int) -> String {
        let number: NSNumber = NSNumber(integerLiteral: amount)
        let cache = NumberFormatCache.currencyRateFormatter
        return cache.string(from: number) ?? "$0"
    }
}
