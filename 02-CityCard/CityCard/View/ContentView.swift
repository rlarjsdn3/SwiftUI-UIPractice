//
//  ContentView.swift
//  CityCard
//
//  Created by 김건우 on 2023/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CitiesView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CityModel())
    }
}
