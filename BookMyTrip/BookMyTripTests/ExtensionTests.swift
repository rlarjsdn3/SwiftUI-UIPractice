//
//  ExtensionTests.swift
//  ExtensionTests
//
//  Created by 김건우 on 4/30/25.
//

import UIKit
import SwiftUI
import Testing
@testable import BookMyTrip

struct ExtensionTests {

    struct EdgeInsetsExtension {

        @Test
        func test_uiEdgeInsetsIsConvertedToEdgeInsetsCorrectly() throws {
            // given
            let uiEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)

            // when
            let edgeInsets = uiEdgeInsets.insets
            try #require(type(of: edgeInsets) == EdgeInsets.self)

            // then
            #expect(uiEdgeInsets.bottom == edgeInsets.bottom)
            #expect(uiEdgeInsets.top == edgeInsets.top)
            #expect(uiEdgeInsets.left == edgeInsets.leading)
            #expect(uiEdgeInsets.right == edgeInsets.trailing)
        }
    }

    struct CGSizeExtension {

        @Test
        func test_uniformSizeInitializerCreatesSquareCGSize() {
            // given
            let size = CGSize(width: 10, height: 10)
            let uniformedSize = CGSize(uniformSize: 10)

            // then
            #expect(size.width == uniformedSize.width)
            #expect(size.height == uniformedSize.height)

        }
    }

    struct ColorExtension {

        @Test(.disabled("Not yet implemented"))
        func test_colorWithLightDarkInitializerResolvesCorrectlyForTrait() {
            // given
            let color = Color(light: .orange, dark: .green)
            let lightTrait = UITraitCollection(userInterfaceStyle: .light)
            let darkTrait = UITraitCollection(userInterfaceStyle: .dark)

            // when
            let lightResolved = UIColor(color).resolvedColor(with: lightTrait)
            let darkResolved = UIColor(color).resolvedColor(with: darkTrait)

            // then
            #expect(lightResolved.rgba == UIColor(.orange).rgba)
            #expect(darkResolved.rgba == UIColor(.green).rgba)
        }
    }
}



fileprivate extension UIColor {

    var rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
}
