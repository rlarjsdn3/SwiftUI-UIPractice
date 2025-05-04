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


#warning("디자인 마지막 최종 점검")
#warning("문서 주석 작성")
#warning("마지막 구조체 이름, 폴더 이름, 파일 위치 점검")
#warning("일부 확장 및 기능 단위 테스트 작성")
