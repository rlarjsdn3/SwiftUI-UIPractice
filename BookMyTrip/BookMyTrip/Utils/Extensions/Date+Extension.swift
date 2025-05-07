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
    func format(_ toString: String, locale: Locale = "en_us") -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = toString
        return formatter.string(from: self)
    }
    
    /// <#Description#>
    /// - Parameter toString: <#toString description#>
    /// - Returns: <#description#>
    func format(_ toString: Date.Format, locale: Locale = "en_us") -> String {
        format(toString.rawValue, locale: locale)
    }
}



