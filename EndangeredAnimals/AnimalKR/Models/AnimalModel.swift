//
//  AnimalModel.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import Foundation

struct AnimalModel: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    let copyright: String
}

struct CoverModel: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
}

struct VideoModel: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let headline: String
    let videoid: String
}

extension AnimalModel {
    static let sample: AnimalModel = .init(
        id: "tiger",
        name: "호랑이",
        headline: "호랑이는 식육목 고양이과에 속하는 포유류로, 고양이과 동물들 중 가장 큰 동물이다. 등의 털색은 선명한 황갈색이고 불규칙적인 검은색 줄무늬가 많다. 배는 백색으로 갈색 반점이 두드러진다. 깊은 산의 밀림 지대에 주로 서식하며 자신이 잡은 신선한 야생동물의 고기를 먹는다. 과거 한반도에 널리 서식하였으나 호피를 이용하기 위한 무분별한 남획과 1940년대 해수구제사업으로 개체수가 급감하여 현재 한반도에서는 절멸된 것으로 여겨진다",
        description: "호랑이 중에서 가장 크며, 몸길이는 수컷 2.2~3.8m, 암컷 1.8~2.8m, 몸무게는 수컷 150~350kg, 암컷 100~200kg이다. 등의 털색은 선명한 황갈색이고 불규칙적인 검은색 줄무늬가 많다. 배는 백색으로 갈색 반점이 두드러진다. 호랑이 중 가장 북방 지역에 서식한다는 특성 상 시베리아호랑이는 겨울에는 겨울털이 길게 자라고 배와 옆구리에 두터운 지방층이 있어 배 부분이 늘어져 보이며, 타 호랑이 아종들에 비해 줄무늬와 털빛이 다소 옅고 털에서 흰 부분이 차지하는 비중이 큰 동시에 줄무늬의 간격이 넓고 형태가 비교적 단조로워 보이는 것 등이 시베리아호랑이가 다른 호랑이 아종들과 구분되는 외형적인 특징이다.\n\n3월과 9월 등 1년에 두 번 털갈이를 한다. 암수모두 단독 생활하며, 자신의 세력권을 분명히 한다. 넓은 지역을 돌아다니며 계속해서 영역을 관리하며, 침입자를 가차 없이 공격한다. 영역 안에 다른 개체의 침범을 막기 위해 나무에 발톱 자국을 내거나 분비물을 뿌리고 몸을 비벼 자신의 털과 체취를 남긴다.\n\n야행성으로 밤에 주로 사냥을 하고 낮에는 은식처에서 잠을 잔다. 보폭은 80cm에 달하며, 항상 뒷발이 앞발자국을 되밟는 습성이 있다.깊은 산의 밀림 지대에 주로 서식한다. 삼림·갈대밭·바위가 많은 곳에 살며 물가의 우거진 숲을 좋아한다. 멧돼지, 대륙사슴, 노루 등 육식동물을 잡아먹으며, 먹이가 풍부한 지방에서는 약 50km², 먹이가 부족한 지방에서는 3,000km²의 세력 범위를 가진다.\n\n야생에서는 약 10~15년 정도이며, 사육 환경에서는 20년이 넘는 기록도 있다. 교미기는 다양하나 11~3월이 많으며, 임신기간은 105~113일, 한배에 2~4마리의 새끼를 낳는다. 새끼는 주로 암컷이 혼자 키우며, 약 2년 ~ 2년 6개월이면 어미로부터 독립한다.",
        link: "https://www.nie.re.kr/endangered_species/home/enspc/enspc06003v.do?species_sn=12",
        image: "tiger", gallery: ["tiger-1", "tiger-2", "tiger-3", "tiger-4", "tiger-5", "tiger-6"],
        fact: [
        "과거 한반도에 널리 서식하였지만 조선시대 말기에 총이 들여오면서부터 사냥이 시작되어 개체수가 감소하였다. 또한, 일제강점기 해수구제사업으로 많은 호랑이가 사냥되며 개체수가 급감하여 현재는 절멸된 것으로 여겨진다.",
        "1918년 강원도 춘성군 가리산, 1922년 경주 대덕산, 1924년 강원도 횡성에서 마지막으로 한 마리가 포획된 이후 발견되지 않고 있다.",
        "해외에는 중국 동북 지구, 만주, 길림성, 송화강, 목단강, 우수리에 분포하고 있고 북한에서는 함경도 지방에 소수가 서식하는 것으로 추측하고 있다."
        ],
        copyright: " 본 저작물은 ‘국립생태원’에서 ‘2018년’ 작성하여 공공누리 제2유형으로 개방한 ‘한눈에 보는 멸종 위기 야생 생물(국립생물자원관)’을 이용하였으며, 해당 저작물은 ‘국립생태원, www.nie.re.kr’에서 무료로 다운받으실 수 있습니다."
    )
}

extension VideoModel {
    static let sample: VideoModel = .init(
        id: "tiger",
        name: "호랑이",
        headline: "호랑이는 식육목 고양이과에 속하는 포유류로, 고양이과 동물들 중 가장 큰 동물이다. 등의 털색은 선명한 황갈색이고 불규칙적인 검은색 줄무늬가 많다.",
        videoid: "FK3dav4bA4s"
    )
}
