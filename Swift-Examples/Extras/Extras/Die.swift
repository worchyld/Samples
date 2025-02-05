//
//  Die.swift
//  Extras
//
//  Created by Amarjit on 10/06/2024.
//

import Foundation
import GameplayKit

protocol Rollable {
    func roll() -> Int
}

struct D6 {
    public static let minimumValue = 1
    public static let maximumValue = 6
    
    public static var roll: Int {
        if #available(iOS 9, *) {
            let d6 = GKRandomDistribution.d6()
            return (d6.nextInt())
        }
        else {
            return Int.random(in: D6.minimumValue...D6.maximumValue)
        }
    }
}

extension D6 {
    static func isValid(_ value: Int) -> Bool {
        return (value >= D6.minimumValue && value <= D6.maximumValue)
    }
    
    static func increment(value: Int, by amount: Int) -> Int {
        var value = value
        guard ((value + amount) <= D6.maximumValue) else {
            return value
        }
        value += amount
        return value
    }
    
    static func decrement(value: Int, by amount: Int) -> Int {
        var value = value
        guard ((value - amount) >= D6.minimumValue) else {
            return value
        }
        value -= amount
        return value
    }
}
