//
//  City.swift
//  CityCard
//
//  Created by 김건우 on 2023/01/26.
//

import Foundation

struct City: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var country: String
    var image: String
    var favoriteCount: Int
    var travelCount: Int
    
    var isFavorite: Bool = false
    var isTravel: Bool = false
    
    mutating func increasseFavorite() {
        favoriteCount += 1
    }
    
    mutating func decreaseFavorite() {
        favoriteCount -= 1
    }
    
    mutating func increasseTravel() {
        travelCount += 1
    }
    
    mutating func decreaseTravel() {
        travelCount -= 1
    }
    
    mutating func favoriteToggle() -> Bool {
        isFavorite = !isFavorite
        return isFavorite
    }
    
    mutating func travelToggle() -> Bool {
        isTravel = !isTravel
        return isTravel
    }
}
