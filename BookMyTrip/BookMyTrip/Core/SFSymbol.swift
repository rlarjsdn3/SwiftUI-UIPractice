//
//  SFSymbol.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

///
enum SFSymbol: String {
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
    case arrowUpDown                = "arrow.up.arrow.down"
    ///
    case chevronLeft                = "chevron.left"
    ///
    @available(*, deprecated, message: "Hamburger 도형을 사용하세요.")
    case line3HorizontalDecrease    = "line.3.horizontal.decrease"
    ///
    case magnifyingGlass            = "magnifyingglass"
    ///
    case bookmarkFill               = "bookmark.fill"    
}


#Preview("person.fill", traits: .sizeThatFitsLayout) {
    Image(symbol: .personFill)
}

#Preview("airplane", traits: .sizeThatFitsLayout) {
    Image(symbol: .airplane)
}

#Preview("building.fill", traits: .sizeThatFitsLayout) {
    Image(symbol: .buildingFill)
}

#Preview("car.fill", traits: .sizeThatFitsLayout) {
    Image(symbol: .carFill)
}

#Preview("ellipsis", traits: .sizeThatFitsLayout) {
    Image(symbol: .ellipsis)
}

#Preview("arrow.right", traits: .sizeThatFitsLayout) {
    Image(symbol: .arrowRight)
}

#Preview("arrow.up.arrow.down", traits: .sizeThatFitsLayout) {
    Image(symbol: .arrowUpDown)
}

#Preview("chevron.left", traits: .sizeThatFitsLayout) {
    Image(symbol: .chevronLeft)
}

#Preview("line.3.horizontal.decrease", traits: .sizeThatFitsLayout) {
    Image(symbol: .line3HorizontalDecrease)
}

