//
//  Color+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 4/30/25.
//

import UIKit
import SwiftUI

extension Color {

    /// <#Description#>
    /// - Parameters:
    ///   - r: <#r description#>
    ///   - g: <#g description#>
    ///   - b: <#b description#>
    init(r: Double, g: Double, b: Double) {
        self.init(
            red: r / 255.0,
            green: g / 255.0,
            blue: b / 255.0
        )
    }


    /// <#Description#>
    /// - Parameters:
    ///   - light: <#light description#>
    ///   - dark: <#dark description#>
    init(light: Color, dark: Color) {
        self.init(
            UIColor(
                light: UIColor(light),
                dark: UIColor(dark)
            )
        )
    }
}

extension UIColor {

    /// <#Description#>
    /// - Parameters:
    ///   - light: <#light description#>
    ///   - dark: <#dark description#>
    convenience init(light: UIColor, dark: UIColor) {
        self.init { trait in
            switch trait.userInterfaceStyle {
            case .light, .unspecified:
                return light
            case .dark:
                return dark
            @unknown default:
                return light
            }
        }
    }
}


extension ShapeStyle where Self == Color {

    /// 텍스트 기본 색상
    static var label: Color {
        Color(uiColor: .label)
    }

    /// 예약 아이콘 배경 색상, 버튼 강조 색상, 추천 여행 배경 색상
    static var tripPurple: Color {
        self.init(
            light: Color(r: 93, g: 103, b: 233),
            dark:  Color(r: 93, g: 103, b: 233)
        )
    }

    // 사용자 프로필 배경 색상
    static var tripLightPurple: Color {
        self.init(
            light: Color(r: 175, g: 180, b: 243),
            dark:  Color(r: 175, g: 180, b: 243)
        )
    }

    /// 예약 아이콘 배경 색상, 추천 여행 배경 색상
    static var tripOrange: Color {
        self.init(
            light: Color(r: 238, g: 121, b: 77),
            dark:  Color(r: 238, g: 121, b: 77)
        )
    }

    /// 예약 아이콘 배경 색상, 추천 여행 배경 색상
    static var tripYellow: Color {
        self.init(
            light: Color(r: 243, g: 174, b: 76),
            dark:  Color(r: 243, g: 174, b: 76)
        )
    }

    /// 예약 아이콘 배경 색상, 추천 여행 배경 색상
    static var tripBlue: Color {
        self.init(
            light: Color(r: 73, g: 163, b: 250),
            dark:  Color(r: 73, g: 163, b: 250)
        )
    }

    /// 티켓 비행기 아이콘 배경 색상
    static var tripGray: Color {
        self.init(
            light: Color(r: 133, g: 142, b: 176),
            dark:  Color(r: 133, g: 142, b: 176)
        )
    }

    /// 버튼 배경 색상
    static var tripSecondary: Color {
        self.init(
            light: Color(r: 245, g: 245, b: 254),
            dark:  Color(r: 41, g: 42, b: 47)
        )
    }

    /// 도형 선 색상
    static var tripStroke: Color {
        self.init(
            light: Color(r: 229, g: 234, b: 245),
            dark:  Color(r: 48, g: 48, b: 50)
        )
    }
}
