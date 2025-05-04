//
//  SFSymbol.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

///
enum MySymbol: String {
    ///
    case calendar                   = "calendar"
    ///
    case personFill                 = "person.fill"
    ///
    case airplane                   = "airplane"
    ///
    case buildingFill               = "building.fill"
    ///
    case carFill                    = "car.fill"
    ///
    case ellipsis                   = "ellipsis"
    ///
    case arrowRight                 = "arrow.right"
    ///
    case arrowLeftRight             = "arrow.left.arrow.right"
    ///
    case arrowUpDown                = "arrow.up.arrow.down"
    ///
    case chevronLeft                = "chevron.left"
    ///
    case chevronDown                = "chevron.down"
    ///
    case magnifyingGlass            = "magnifyingglass"
    ///
    case bookmarkFill               = "bookmark.fill"
    ///
    case chairLoungeFill            = "chair.lounge.fill"
    ///
    case xmarkCircle                = "xmark.circle.fill"
}

extension Image {
    
    /// <#Description#>
    /// - Parameter travelSymbol: <#travelSymbol description#>
    init(symbol: MySymbol) {
        self = Image(systemName: symbol.rawValue)
    }
}
