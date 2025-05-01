//
//  FileManager+SharedContainer.swift
//  Weather
//
//  Created by 김건우 on 2023/02/16.
//

import Foundation

extension FileManager {
    static var sharedContainerURL: URL {
        return FileManager.default.containerURL(
            forSecurityApplicationGroupIdentifier: "group.com.Zizi-Kim.Weather.contents"
        )!
    }
}
