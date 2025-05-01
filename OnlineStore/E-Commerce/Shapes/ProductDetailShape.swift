//
//  ProductDetailShape.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/16.
//

import SwiftUI

struct ProductDetailShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(
                to: CGPoint(
                    x: rect.width,
                    y: rect.height
                )
            )
            
            path.addArc(
                tangent1End: CGPoint(
                    x: rect.width,
                    y: rect.height
                ),
                tangent2End: CGPoint(
                    x: rect.width,
                    y: 0
                ),
                radius: 20
            )
            
            path.addArc(
                tangent1End: CGPoint(
                    x: rect.width,
                    y: 0
                ), tangent2End: CGPoint(
                    x: 0,
                    y: rect.height - 100
                ),
                radius: 20
            )
            
            path.addArc(
                tangent1End: CGPoint(
                    x: 0,
                    y: rect.height - 100
                ), tangent2End: CGPoint(
                    x: 0,
                    y: rect.height
                ),
                radius: 20
            )
            
            path.addArc(
                tangent1End: CGPoint(
                    x: 0,
                    y: rect.height
                ), tangent2End: CGPoint(
                    x: rect.width,
                    y: rect.height
                ),
                radius: 20
            )
            
        }
    }
}

struct ProductDetailShape_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailShape()
    }
}
