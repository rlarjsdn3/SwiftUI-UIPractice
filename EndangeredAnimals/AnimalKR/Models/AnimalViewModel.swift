//
//  AnimalViewModel.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI
import Foundation

class AnimalViewModel: ObservableObject {
    @Published var animals: [AnimalModel] = Bundle.main.JSONDecode("animals.json")
    @Published var covers: [CoverModel] = Bundle.main.JSONDecode("covers.json")
    @Published var videos: [VideoModel] = Bundle.main.JSONDecode("videos.json")
    
    @Published var selectedImage = "tiger"
    
    @Published var gridLayout: [GridItem] = [GridItem(.flexible())]
    @Published var gridColumn: Double = 4.0
    
    func gridSwitch() {
        gridLayout = [GridItem](repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    
    init() {
        gridLayout = [GridItem](repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
}
