//
//  MyAsset.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

enum MyAsset: String {
    case mapPin = "map-pin"
    case discount = "discount"
}

extension Image {
    
    /// 지정된 애셋 이름으로 이미지를 생성합니다.
    /// - Parameter asset: 사용할 MyAsset 타입의 이미지 애셋
    init(asset: MyAsset) {
        self.init(asset.rawValue)
    }
}
