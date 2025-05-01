//
//  ViewModel.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    @Published var products: [Product] = Product.sample
}
