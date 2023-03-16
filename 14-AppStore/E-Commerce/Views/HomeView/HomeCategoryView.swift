//
//  HeomCategoryView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct HomeCategoryView: View {
    @Binding var selectedProductCategory: ProductCategory
    var categoryNamespace: Namespace.ID
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(ProductCategory.allCases, id: \.self) { category in
                    CategoryButton(category: category, selectedProductCategory: $selectedProductCategory, categoryNamespace: categoryNamespace)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct HomeCategoryView_Previews: PreviewProvider {
    @Namespace static var categoryNamespace
    
    static var previews: some View {
        HomeCategoryView(selectedProductCategory: .constant(.all), categoryNamespace: categoryNamespace)
    }
}
