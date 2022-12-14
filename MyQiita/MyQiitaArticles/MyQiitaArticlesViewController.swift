//
//  ViewController.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import UIKit

protocol MyQiitaArticlesPresenterLike: AnyObject {
    var articles: [Article] { get set }
    
    func getMyQiitaArticlesAfterAuthorize(url: URL)
    func navigateToAricleWebViewController(indexPath: IndexPath)
}

final class MyQiitaArticlesViewController: UIViewController {
    private let viewContainer: MyQiitaArticlesViewLike
    private let model: MyQiitaArticlesModel
    private let navigator: MyQiitaArticlesNavigatorLike
    var articles: [Article] = []
 
    init(viewContainer: MyQiitaArticlesViewLike = MyQiitaArticlesView(),
         model: MyQiitaArticlesModel = MyQiitaArticlesModelImpl(),
         navigator: MyQiitaArticlesNavigatorLike = MyQiitaArticlesNavigator()) {
        self.viewContainer = viewContainer
        self.model = model
        self.navigator = navigator
        
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewContainer.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewContainer.presenterLike = self
        getMyQiitaArticles()
        
        self.title = "記事一覧"
    }
    
    private func getMyQiitaArticles() {
        model.getMyQiitaArticles { [weak self] result in
            self?.handleMyArticlesData(result: result)
        }
    }
    
   private func handleMyArticlesData(result: Result<[Article], Error>) {
        switch result {
        case .success(let articles):
            self.articles = articles
            self.viewContainer.successGotMyQiitaArticles()
        case .failure(let error):
            guard let error = error as? APIError else {
                self.navigator.showAlert(on: self)
                return
            }
            
            switch error {
            case .invailedAccessToken:
                self.navigator.presentAuthorizeMyQiitaViewController(on: self)
            default:
                self.navigator.showAlert(on: self)
            }
        }
    }
}

extension MyQiitaArticlesViewController: MyQiitaArticlesPresenterLike {
    func navigateToAricleWebViewController(indexPath: IndexPath) {
        navigator.navigateArticleWebViewController(on: self, urlString: articles[indexPath.row].url)
    }
    
    func getMyQiitaArticlesAfterAuthorize(url: URL) {
        model.getMyQiitaAriclesAfterAuthorize(url: url) { [weak self] result in
            self?.handleMyArticlesData(result: result)
        }
    }
}
