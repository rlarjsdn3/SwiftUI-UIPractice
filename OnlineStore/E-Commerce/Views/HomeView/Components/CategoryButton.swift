//
//  CategoryButtonView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct CategoryButton: View {
    var category: ProductCategory
    @Binding var selectedProductCategory: ProductCategory
    
    var categoryNamespace: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                selectedProductCategory = category
            }
        } label: {
            Text(category.name)
                .fontWeight(.bold)
                .foregroundColor(isSelected() ? .white : .black)
                .padding(.vertical, 5)
                .padding(.horizontal, isSelected() ? 20 : 0)
                .background {
                    if isSelected() {
                        Capsule()
                            .fill(.black)
                            .matchedGeometryEffect(id: "category", in: categoryNamespace)
                    }
                }
        }
        .padding(.horizontal, 10)
    }
    
    func isSelected() -> Bool {
        return selectedProductCategory == category
    }
}

struct CategoryButtonView_Previews: PreviewProvider {
    @Namespace static var categoryNamespace
    
    static var previews: some View {
        CategoryButton(category: .all, selectedProductCategory: .constant(.all), categoryNamespace: categoryNamespace)
    }
}
