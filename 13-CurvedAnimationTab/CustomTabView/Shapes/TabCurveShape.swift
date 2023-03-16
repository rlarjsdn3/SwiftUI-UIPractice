//
//  TabCurveShape.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/12.
//

import SwiftUI

struct TabCurveShape: Shape {
    var midX: CGFloat
    
    var animatableData: CGFloat {
        get {
            midX
        }
        set {
            midX = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(
                to: CGPoint(
                    x: rect.width,
                    y: rect.height
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: rect.width,
                    y: 0
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: 0,
                    y: 0
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: 0,
                    y: rect.height
                )
            )
            
            path.move(
                to: CGPoint(
                    x: midX - 40,
                    y: rect.height
                )
            )
            
            path.addCurve(
                to: CGPoint(
                    x: midX,
                    y: rect.height - 20
                ),
                control1: CGPoint(
                    x: midX - 15,
                    y: rect.height
                ),
                control2: CGPoint(
                    x: midX - 15,
                    y: rect.height - 20
                )
            )
            
            path.addCurve(
                to: CGPoint(
                    x: midX + 40,
                    y: rect.height
                ),
                control1: CGPoint(
                    x: midX + 15,
                    y: rect.height - 20
                ),
                control2: CGPoint(
                    x: midX + 15,
                    y: rect.height
                )
            )
        }
    }
}

struct TabCurveShape_Previews: PreviewProvider {
    static var previews: some View {
        TabCurveShape(midX: 100)
    }
}
