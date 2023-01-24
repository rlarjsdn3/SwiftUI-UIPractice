//
//  CalculatorApp.swift
//  Calculator
//
//  Created by 김건우 on 2023/01/24.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(CalculatorView.ViewModel())
        }
    }
}
