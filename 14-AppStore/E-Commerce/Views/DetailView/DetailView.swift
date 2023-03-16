//
//  DetailView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var product: Product
    @Binding var showDetailView: Bool
    var cardNamespace: Namespace.ID
    
    @State private var transitionAnimation = false
    
    var body: some View {
        VStack {
            DetailHeaderView(showDetailView: $showDetailView, transitionAnimation: $transitionAnimation)
            DetailImageBoxView(product: product, cardNamespace: cardNamespace)
            Spacer(minLength: 0)
            DetailScrollView(transitionAnimation: $transitionAnimation)
            DetailButtonView(showDetailView: $showDetailView, transitionAnimation: $transitionAnimation)
        }
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7).delay(0.25)) {
                transitionAnimation = true
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    @Namespace static var cardNamespace: Namespace.ID
    
    static var previews: some View {
        DetailView(
            product: .sample[0],
            showDetailView: .constant(true),
            cardNamespace: cardNamespace
        )
        .environmentObject(ViewModel())
    }
}
