//
//  CitiesView.swift
//  CityCard
//
//  Created by 김건우 on 2023/01/26.
//

import SwiftUI

struct CitiesView: View {
    @EnvironmentObject var cityModel: CityModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(cityModel.cities) { city in
                        CityCard(city: city)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Cities")
        }
    }
}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
            .environmentObject(CityModel())
    }
}
