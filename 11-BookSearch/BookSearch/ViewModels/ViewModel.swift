//
//  BookAPIRequest.swift
//  BookSearch
//
//  Created by 김건우 on 2023/03/08.
//

import Alamofire
import Foundation

class ViewModel: ObservableObject {
    @Published var searchData: BookModel = BookModel()
    @Published var favoriteData: [BookModel.Item] = []
    
    func requestBookAPISearch(query: String) {
        let basedURL = "https://openapi.naver.com/v1/search/book.json"
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": Client.clientId,
            "X-Naver-Client-Secret": Client.clientSecret
        ]
        
        let parameters: Parameters = [
            "query": query,
            "display": 50
        ]
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        AF.request(basedURL,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: headers
        )
        .validate(statusCode: 200...500)
        .responseDecodable(of: BookModel.self, decoder: decoder) { response in
            switch response.result {
            case .success(let data):
                guard let statusCode = response.response?.statusCode else { return }
                if statusCode == 200 {
                    DispatchQueue.main.async {
                        self.searchData = data
                    }
                }
                print("Naver Search API Call SUCESS: \(data)")
            case.failure(let error):
                print("Naver Search API Call FAILURE: \(error)")
            }
        }
    }
}
