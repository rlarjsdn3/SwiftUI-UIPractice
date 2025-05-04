//
//  Date+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/3/25.
//

import Foundation

extension Date {

    enum Format: String {
        ///
        case dMMMMyyyy = "d MMMM yyyy"
    }
    
    /// <#Description#>
    /// - Parameter toString: <#toString description#>
    /// - Returns: <#description#>
    func format(_ toString: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = "en_us"
        formatter.dateFormat = toString
        return formatter.string(from: self)
    }
    
    /// <#Description#>
    /// - Parameter toString: <#toString description#>
    /// - Returns: <#description#>
    func format(_ toString: Date.Format) -> String {
        format(toString.rawValue)
    }
}



