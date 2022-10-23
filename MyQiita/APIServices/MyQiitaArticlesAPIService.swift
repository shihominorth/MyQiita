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
    func showMyArticlesAfterAuthorize(url: URL, completion: @escaping (Error?) -> Void)
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
    
    func showMyArticlesAfterAuthorize(url: URL, completion: @escaping (Error?) -> Void) {
        guard let valiedCode = isValiedCode(url: url) else {
            return
        }
        
        postAccessToken(code: valiedCode) { response in
            switch response {
            case .success(let accessToken):
                UserDefaults.standard.setValue(accessToken.token, forKey: "token")
                
                completion(nil)
            case .failure(let err):
                completion(err)
            }
        }
    }
    
    private func isValiedCode(url: URL) -> String? {
        guard let queryItems = URLComponents(string: url.absoluteString)?.queryItems,
              let code = queryItems.first(where: {$0.name == "code"})?.value,
              let getState = queryItems.first(where: {$0.name == "state"})?.value,
              getState == state
        else {
            return nil
        }
        
        return code
    }
    
    private func postAccessToken(code: String, completion: @escaping (Result<AccessToken, Error>) -> Void) {
        let endPoint = "access_tokens"
        guard
            let clientSecret = Env["CLIENT_SECRET"],
            let url = URL(string: host + endPoint + "?" +
                            "client_id=\(clientId)" + "&" +
                            "client_secret=\(clientSecret)" + "&" +
                            "code=\(code)") else {
            completion(.failure(APIError.invailedURL))
            return
        }
        
        AF.request(url, method: .post).responseDecodable { (response: AFDataResponse<AccessToken>) in
            do {
                guard let data = response.data else {
                    completion(.failure(APIError.postAccesToken))
                    return
                }
                
                if let err = response.error {
                    completion(.failure(err))
                }
                else {
                    guard let accessToken = try? JSONDecoder().decode(AccessToken.self, from: data) else {
                        return
                    }

                    completion(.success(accessToken))
                }
            }
        }
        
    }
}




