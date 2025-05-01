//
//  Image+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

extension Image {
    
    /// <#Description#>
    /// - Parameter travelSymbol: <#travelSymbol description#>
    init(symbol: SFSymbol) {
        self = Image(systemName: symbol.rawValue)
    }
}
