//
//  SFSymbol.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

enum MySymbol: String {

    case calendar                   = "calendar"

    case personFill                 = "person.fill"

    case airplane                   = "airplane"

    case buildingFill               = "building.fill"

    case carFill                    = "car.fill"

    case ellipsis                   = "ellipsis"
    
    case arrowRight                 = "arrow.right"

    case arrowLeftRight             = "arrow.left.arrow.right"

    case arrowUpDown                = "arrow.up.arrow.down"

    case chevronLeft                = "chevron.left"

    case chevronDown                = "chevron.down"

    case magnifyingGlass            = "magnifyingglass"

    case bookmarkFill               = "bookmark.fill"

    case chairLoungeFill            = "chair.lounge.fill"

    case xmarkCircle                = "xmark.circle.fill"
}

extension Image {
    
    /// 지정된 시스템 심볼을 사용하여 이미지를 생성합니다.
    /// - Parameter symbol: 사용할 MySymbol 타입의 시스템 심볼
    init(symbol: MySymbol) {
        self = Image(systemName: symbol.rawValue)
    }
}
