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
    
    /// 지정된 형식으로 날짜를 문자열로 변환합니다.
    /// - Parameters:
    ///   - toString: 날짜 형식 문자열
    ///   - locale: 로케일 (기본값: "en_us")
    /// - Returns: 지정된 형식의 날짜 문자열
    func format(_ toString: String, locale: Locale = "en_us") -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = toString
        return formatter.string(from: self)
    }
    
    /// 지정된 형식으로 날짜를 문자열로 변환합니다.
    /// - Parameters:
    ///   - toString: 날짜 형식 (Date.Format 열거형)
    ///   - locale: 로케일 (기본값: "en_us")
    /// - Returns: 지정된 형식의 날짜 문자열
    func format(_ toString: Date.Format, locale: Locale = "en_us") -> String {
        format(toString.rawValue, locale: locale)
    }
}



