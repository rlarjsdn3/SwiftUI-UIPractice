//
//  StrokeConfigurable.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

protocol StrokeConfigurable {
    ///
    var lineWidth: CGFloat { get }
    ///
    var lineCap: CGLineCap { get }
    ///
    var lineJoin: CGLineJoin { get }
    ///
    var miterLimit: CGFloat { get }
    ///
    var dash: [CGFloat] { get }
    ///
    var dashPhase: CGFloat { get }
}
