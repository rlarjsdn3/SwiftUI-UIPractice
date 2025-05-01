//
//  JSONDecodeExtension.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import Foundation

extension Bundle {
    func JSONDecode<T: Codable>(_ file: String) -> T {
        // 1. JSON 파일 가져오기
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Fail to locate \(file) to bundle")
        }
        // 2. JSON 파일로부터 DATA 생성하기
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fail to locate \(file) to bundle")
        }
        // 3. DATA를 Codable 프로토콜을 준수하는 구조체로 파싱하기
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Fail to locate \(file) to bundle")
        }
    }
}
