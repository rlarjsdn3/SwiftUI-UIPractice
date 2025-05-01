//
//  ProductCategory.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import Foundation

enum ProductCategory: CaseIterable {
    case all
    case appleWatch
    
    var name: String {
        switch self {
        case .all:
            return "전체"
        case .appleWatch:
            return "애플워치"
        }
    }
}
