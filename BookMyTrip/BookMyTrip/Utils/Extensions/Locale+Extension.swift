//
//  Locale+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/3/25.
//

import Foundation

extension Locale: @retroactive ExpressibleByStringLiteral {

    public init(stringLiteral value: StringLiteralType) {
        self.init(identifier: value)
    }
}
