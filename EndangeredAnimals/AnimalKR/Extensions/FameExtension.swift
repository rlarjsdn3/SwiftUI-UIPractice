//
//  FameExtension.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import Foundation
import SwiftUI

// MARK: - RESPONSIVE SCREEN

extension CGFloat {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

// MARK: - FRAME MODIFIER

extension View {
    func vCenter() -> some View {
        self.frame(maxHeight: .infinity, alignment: .center)
    }
    
    func vTop() -> some View {
        self.frame(maxHeight: .infinity, alignment: .top)
    }
    
    func vBottom() -> some View {
        self.frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    func hCenter() -> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }
    
    func hLeading() -> some View {
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
}


