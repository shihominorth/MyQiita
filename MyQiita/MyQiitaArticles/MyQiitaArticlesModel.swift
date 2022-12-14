//
//  MyQiitaArticlesModel.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import Foundation

protocol MyQiitaArticlesModel {
    func getMyQiitaArticles(completion: @escaping (Result<[Article], Error>) -> Void)
    func getMyQiitaAriclesAfterAuthorize(url: URL, completion: @escaping (Result<[Article], Error>) -> Void)
}

final class MyQiitaArticlesModelImpl: MyQiitaArticlesModel {
    private var APIService: MyQiitaArtcilesAPIServiceLike
    
    init(APIService: MyQiitaArtcilesAPIServiceLike = MyQiitaArtcilesAPIService()) {
        self.APIService = APIService
    }
    
    func getMyQiitaArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        APIService.getMyArticles { result in
            switch result {
            case .success(let articles):
                completion(.success(articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getMyQiitaAriclesAfterAuthorize(url: URL, completion: @escaping (Result<[Article], Error>) -> Void)  {
        APIService.showMyArticlesAfterAuthorize(url: url) { error in
            guard let error else {
                self.getMyQiitaArticles { result in
                    switch result {
                    case .success(let articles):
                        completion(.success(articles))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
                return
            }
            
            completion(.failure(error))
        }
    }
    
}
