//
//  MyQiitaArticlesAPIService.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-23.
//

import Alamofire
import Foundation

protocol MyQiitaArtcilesAPIServiceLike: AnyObject where Self: APIService {
    func getMyArticles(completion: @escaping (Result<[Article], Error>) -> Void)
}

final class MyQiitaArtcilesAPIService: APIService, MyQiitaArtcilesAPIServiceLike {
    func getMyArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        let endPoint = "authenticated_user/items"
        
        guard let url = URL(string: host + endPoint),
              let token = UserDefaults.standard.string(forKey: "token"),
              !token.isEmpty else {
            completion(.failure(APIError.invailedAccessToken))

            return
        }
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        let parameters = [
            "page": 1,
            "per_page": 20
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers).responseDecodable { (response: AFDataResponse<[Article]>) in
            
            do {
                guard
                    let data = response.data else {
                    completion(.failure(APIError.invaliedData))
                    return
                }
                
                if let err = response.error {
                    completion(.failure(err))
                }
                else {
                    let articles = try? JSONDecoder().decode([Article].self, from: data)
                    
                    guard let articles = articles else  {
                        completion(.failure(APIError.invailedJSON))

                        return
                    }
                    
                    completion(.success(articles))
                }
            }
        }
        
    }
}




