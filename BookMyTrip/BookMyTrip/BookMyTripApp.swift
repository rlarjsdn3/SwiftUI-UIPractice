//
//  BookMyTripApp.swift
//  BookMyTrip
//
//  Created by 김건우 on 4/30/25.
//

import SwiftUI

@main
struct BookMyTripApp: App {
    var body: some Scene {
        WindowGroup {
            FindDealsView()
                .dynamicTypeSize(.xSmall ... .xLarge)
        }
    }
}

#warning("일부 데이터 모델 샘플에 맞게 정확하게 수정하기")
#warning("라이트 모드/다크 모드에 따라 그림자 투명도 조정")

#warning("Swift Concurrency 적용")
#warning("일부 확장 및 기능 단위 테스트 작성")
