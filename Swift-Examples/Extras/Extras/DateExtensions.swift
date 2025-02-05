//
//  DateExtensions.swift
//  Extras
//
//  Created by Amarjit on 10/06/2024.
//

import Foundation

extension Date {
    static var currentTimeStamp: Int64{
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
}

