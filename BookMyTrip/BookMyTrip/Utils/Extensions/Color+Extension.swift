//
//  Color+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 4/30/25.
//

import UIKit
import SwiftUI

extension Color {

    /// RGB 값을 사용하여 색상을 생성합니다.
    /// - Parameters:
    ///   - r: 빨간색 값 (0 ~ 255)
    ///   - g: 녹색 값 (0 ~ 255)
    ///   - b: 파란색 값 (0 ~ 255)
    init(r: Double, g: Double, b: Double) {
        self.init(
            red: r / 255.0,
            green: g / 255.0,
            blue: b / 255.0
        )
    }


    /// 라이트 모드와 다크 모드에 따른 색상을 생성합니다.
    /// - Parameters:
    ///   - light: 라이트 모드에서 사용할 색상
    ///   - dark: 다크 모드에서 사용할 색상
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

    /// 라이트 모드와 다크 모드에 따른 동적 색상을 생성합니다.
    /// - Parameters:
    ///   - light: 라이트 모드에서 사용할 색상
    ///   - dark: 다크 모드에서 사용할 색상
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
