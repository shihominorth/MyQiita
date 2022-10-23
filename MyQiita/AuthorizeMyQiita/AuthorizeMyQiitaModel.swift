//
//  AuthorizeMyQiitaModel.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-23.
//

import Foundation

protocol AuthorizeMyQiitaModel: AnyObject {
    func openAuthorizeURL(errorBlock: @escaping () -> Void)
}

class AuthorizeMyQiitaImpl: AuthorizeMyQiitaModel {
    let APIService: AuthorizeQiitaAPIServiceLike
    
    init(APIService: AuthorizeQiitaAPIServiceLike = AuthorizeQiitaAPIService()) {
        self.APIService = APIService
    }
    
    func openAuthorizeURL(errorBlock: @escaping () -> Void) {
        APIService.openAuthorizeUrl()
    }
}
