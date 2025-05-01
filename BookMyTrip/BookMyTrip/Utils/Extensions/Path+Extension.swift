//
//  Path+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

extension Path {
    
    /// <#Description#>
    /// - Parameters:
    ///   - x: <#x description#>
    ///   - y: <#y description#>
    mutating func move(toX x: Double, y: Double) {
        self.move(to: CGPoint(x: x, y: y))
    }

    /// <#Description#>
    /// - Parameters:
    ///   - x: <#x description#>
    ///   - y: <#y description#>
    mutating func addLine(toX x: Double, y: Double) {
        self.addLine(to: CGPoint(x: x, y: y))
    }
}
