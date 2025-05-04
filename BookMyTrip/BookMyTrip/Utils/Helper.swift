//
//  Helper.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/4/25.
//

import UIKit

class Helper {
    
    static func keyWindow() -> UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else {
                continue
            }

            if windowScene.windows.isEmpty {
                continue
            }

            guard let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                continue
            }
            return window
        }
        return nil
    }
}
