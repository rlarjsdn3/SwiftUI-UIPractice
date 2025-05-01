//
//  AnyShapeWrapper.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct AnyShapeWrapper: Shape {
    private let _path: (CGRect) -> Path

    init<S: Shape>(_ shape: S) {
        self._path = shape.path(in:)
    }

    func path(in rect: CGRect) -> Path {
        _path(rect)
    }
}
extension Shape {
    func eraseToAnyShape() -> AnyShapeWrapper {
        AnyShapeWrapper(self)
    }
}
