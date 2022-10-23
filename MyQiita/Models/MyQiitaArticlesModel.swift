//
//  MyQiitaArticlesModel.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import Foundation

protocol MyQiitaArticlesModel {
    func getMyQiitaArticles(completion: @escaping ([Article]?) -> Void)
}

final class MyQiitaArticlesModelImpl: MyQiitaArticlesModel {
    private var APIService: MyQiitaArtcilesAPIServiceLike
        
    init(APIService: MyQiitaArtcilesAPIServiceLike = MyQiitaArtcilesAPIService()) {
        self.APIService = APIService
    }
        
    func getMyQiitaArticles(completion: @escaping ([Article]?) -> Void) {
        APIService.getMyArticles { result in
            switch result {
            case .success(let articles):
                completion(articles)
            case .failure(let error):
                print(error)
                
                completion(nil)
            }
        }
    }
}
