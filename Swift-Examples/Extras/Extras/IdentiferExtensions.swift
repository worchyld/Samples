//
//  IdentiferExtensions.swift
//  Extras
//
//  Created by Amarjit on 10/06/2024.
//

import Foundation

// Can use unique simple strings as Identifier

struct Identifier: Hashable {
    let string: String
}

extension Identifier: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        string = value
    }
}

extension Identifier: CustomStringConvertible {
    var description: String {
        return string
    }
}

extension Identifier: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        string = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
}
