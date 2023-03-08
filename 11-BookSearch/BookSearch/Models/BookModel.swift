//
//  BookModel.swift
//  BookSearch
//
//  Created by 김건우 on 2023/03/08.
//

import Foundation

struct BookModel: Codable {
    var total: Int // 총 검색 결과 개수
    
    var items: [Item]
    struct Item: Codable, Hashable {
        var title: String // 책 제목
        var link: String // 네이버 도서 정보 URL
        var image: String // 섬네일 이미지의 URL
        var author: String // 저자 이름
        var discount: String // 판매 가격
        var publisher: String // 출판사
        var pubdate: String // 출간일
        var isbn: String // ISBN
        var description: String // 네이버 도서의 책 소개
    }
}

extension BookModel {
    init() {
        self.total = 0
        self.items = []
    }
    
    mutating func clear() {
        self.total = 0
        self.items = []
    }
}

extension BookModel {
    static var preview: BookModel {
        BookModel(
            total: 1,
            items: [
                .init(
                    title: "뮤추얼 펀드 상식",
                    link: "https://search.shopping.naver.com/book/catalog/32444879965",
                    image: "https://shopping-phinf.pstatic.net/main_3244487/32444879965.20221019132021.jpg",
                    author: "존 보글",
                    discount: "25200",
                    publisher: "연암사",
                    pubdate: "20170920",
                    isbn: "9791155580233",
                    description: "존 보글은 인덱스 펀드의 창시자이자 세계에서 가장 큰 뮤추얼 펀드 회사인 뱅가드 그룹의 설립자로 인덱스 펀드와 낮은 수수료로 금융의 혁신을 이룩했다. 주식시장은 이길 수 있는 게임이 아니기 때문에 시장 평균 수익률을 따르는 인덱스 펀드를 개발했고, 이를 장기투자하는 게 보글의 핵심 전략이다. 장기투자는 복리의 마술이 적용되기 때문에 엄청난 수익이 가능하기 때문이다. 효과적인 투자 전략은 수수료를 포함한 각종 비용을 최소화하는 것이다. 대부분의 투자회사들은 높은 비용 부과, 잦은 종목교체, 판매 중시와 같은 잘못을 저지르고 있다.\n\n보글이 『뮤추얼 펀드 상식』에서 주장하는 네 가지 투자 원칙은 다음과 같다. 주식시장은 이길 수 없는 게임이기 때문에 일반투자자들이 시장의 평균 수익률을 능가하기란 쉬운 일이 아니다. 따라서 시장의 평균 수익률이라는 안정된 수익을 추구하는 단순성을 유지해야 한다. 투자에 있어 주당순이익, 배당성향, 이자수익 등 경제적인 요소를 중시하고, 시장의 변동성, 심리적인 영향, 주가 수익률 등 시장의 상황에 따라서 변하는 비경제적인 요소는 배제하는 집중성을 가져야 한다.\n\n높은 수수료를 지불하고 투자한다면 투자 수익은 적을 수밖에 없다. 실제로 투자에서는 수수료가 큰 몫을 차지하고 있는데 투자자들이 정확하게 인지하지 못하고 있는 실정이다. 인덱스 펀드는 수수료가 아주 적은 효율성이 높은 펀드다. 투자회사는 투자자의 이익을 우선하는 성실성을 가져야 한다. 고객의 이익보다 투자회사의 배만 불리는 방식으로 운영되고 있다면 ‘성실한 관리자’라 할 수 없다. 투자자들의 이익을 대변하는 회사만이 좋은 관계를 오래도록 유지할 것이다."
                )
            ]
        )
    }
}
