//
//  ProductModel.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI
import Foundation

struct Product: Identifiable {
    var id: String = UUID().uuidString
    var title: String // 제품 이름
    var subTitle: String // 제품 보조 이름
    var price: String // 가격
    var rating: String // 평점
    var image: String // 제품 이미지
    var color: Color // 바탕 색상
}

extension Product {
    static var sample: [Product] {
        [.init(
            title: "Apple Watch Ultra",
            subTitle: "1st Generation",
            price: "$799",
            rating: "8.3",
            image: "AppleWatchUltra",
            color: Color("color1")
        )]
    }
}
