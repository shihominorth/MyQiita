//
//  AuthorizeQiitaAPIService.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-23.
//

import Alamofire
import Foundation

protocol AuthorizeQiitaAPIServiceLike: AnyObject where Self: APIService {
    func openAuthorizeUrl()
    func isValiedCode(url: URL) -> String?
    func postAccessToken(code: String, completion: @escaping (Result<AccessToken, Error>) -> Void)
}


class AuthorizeQiitaAPIService: APIService, AuthorizeQiitaAPIServiceLike {
    private let clientId = "82902f33d139611c9d301e7fede4a5d1ad077067"
    private let clientSecret = Env["CLIENT_SECRET"]
    
    private let state = "86B3F670AFC10C49"
    
    private var oauthURL: URL? {
        let endpoint = "oauth/authorize"
        
        return URL(string: host + endpoint + "?" + "client_id=\(clientId)" + "&" +
                   "scope=read_qiita+write_qiita" + "&" +
                   "state=\(state)")!
    }
    
    func openAuthorizeUrl() {
        guard let oauthURL else {
            return
        }
        
        UIApplication.shared.open(oauthURL)
    }
    
    func isValiedCode(url: URL) -> String? {
        guard let queryItems = URLComponents(string: url.absoluteString)?.queryItems,
              let code = queryItems.first(where: {$0.name == "code"})?.value,
              let getState = queryItems.first(where: {$0.name == "state"})?.value,
              getState == self.state
        else {
            return nil
        }
        
        return code
        
    }
    
    func postAccessToken(code: String, completion: @escaping (Result<AccessToken, Error>) -> Void) {
        let endPoint = "access_tokens"
        
        guard let clientSecret = clientSecret,
              let url = URL(string: host + endPoint + "?" +
                            "client_id=\(clientId)" + "&" +
                            "client_secret=\(clientSecret)" + "&" +
                            "code=\(code)") else {
            completion(.failure(APIError.invailedUrl))
            return
        }
        
        AF.request(url, method: .post).responseDecodable { (response: AFDataResponse<AccessToken>) in
            do {
                guard
                    let data = response.data else {
                    completion(.failure(APIError.invaliedData))
                    return
                }
                
                let accessToken = try JSONDecoder().decode(AccessToken.self, from: data)
                
                completion(.success(accessToken))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
