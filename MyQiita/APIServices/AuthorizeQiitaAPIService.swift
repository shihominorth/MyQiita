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
}


class AuthorizeQiitaAPIService: APIService, AuthorizeQiitaAPIServiceLike {
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
}
