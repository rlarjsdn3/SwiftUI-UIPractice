//
//  MyAsset.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

enum MyAsset: String {
    ///
    case mapPin = "map-pin"
    ///
    case discount = "discount"
}

extension Image {
    
    /// <#Description#>
    /// - Parameter asset: <#asset description#>
    init(asset: MyAsset) {
        self.init(asset.rawValue)
    }
}
