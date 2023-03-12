//
//  CustomTabShape.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/11.
//

import UIKit
import SwiftUI

struct CustomTabShape: Shape {    
    func path(in rect: CGRect) -> Path {
        let rectangle = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 10, height: 10)
        )
        
        return Path(rectangle.cgPath)
    }
}

struct CustomTabShape_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabShape()
    }
}
