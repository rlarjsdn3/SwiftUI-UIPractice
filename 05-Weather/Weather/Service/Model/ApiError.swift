//
//  ApiError.swift
//  Weather
//
//  Created by 김건우 on 2023/02/15.
//

import Foundation

enum ApiError: Error {
    case unknown
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}
