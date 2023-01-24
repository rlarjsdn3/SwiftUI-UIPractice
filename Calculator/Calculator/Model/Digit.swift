//
//  Digit.swift
//  Calculator
//
//  Created by 김건우 on 2023/01/24.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(self.rawValue)"
    }
}
