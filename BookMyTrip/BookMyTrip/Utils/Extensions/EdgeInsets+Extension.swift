//
//  EdgeInsets+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI


extension EdgeInsets {
    
    /// <#Description#>
    /// - Parameters:
    ///   - vertical: <#vertical description#>
    ///   - horizontal: <#horizontal description#>
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(
            top: vertical,
            leading: horizontal,
            bottom: vertical,
            trailing: horizontal
        )
    }
}

extension EdgeInsets {

    /// <#Description#>
    static var zero: EdgeInsets { EdgeInsets(vertical: 0, horizontal: 0) }
}
