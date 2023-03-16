//
//  HomeView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var selectedProductCategory: ProductCategory = .all
    @State private var showDetailView: Bool = false
    @State private var selectedProduct: Product = Product.sample[0]
    
    @Namespace var categoryNamespace: Namespace.ID
    @Namespace var cardNamespace: Namespace.ID
    
    var body: some View {
        ZStack {
            if !showDetailView {
                VStack(spacing: 0) {
                    HomeHeaderView()
                    ScrollView(showsIndicators: false) {
                        HomeTitleView()
                        HomeCategoryView(
                            selectedProductCategory: $selectedProductCategory,
                            categoryNamespace: categoryNamespace
                        )
                        HomeProductGridView(
                            selectedProduct: $selectedProduct,
                            showDetailView: $showDetailView,
                            cardNamespace: cardNamespace
                        )
                    }
                    
                    Spacer()
                }
            } else {
                DetailView(
                    product: selectedProduct,
                    showDetailView: $showDetailView,
                    cardNamespace: cardNamespace
                )
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewModel())
    }
}
