//
//  ViewController.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import UIKit

protocol MyQiitaArticlesPresenterLike: AnyObject {
    var articles: [Article] { get set }
}

final class MyQiitaArticlesViewController: UIViewController {
    private let viewContainer: MyQiitaArticlesViewLike
    private let model: MyQiitaArticlesModel
    var articles: [Article] = []
 
    init(viewContainer: MyQiitaArticlesViewLike,
         model: MyQiitaArticlesModel) {
        self.viewContainer = viewContainer
        self.model = model
        
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
    }
    
    private func getMyQiitaArticles() {
        model.getMyQiitaArticles { articles in
            if let articles {
                self.articles = articles
                self.viewContainer.successGotMyQiitaArticles()
            } else {
                self.viewContainer.failedGettingMyQiitaArticles()
            }
        }
    }
}

extension MyQiitaArticlesViewController: MyQiitaArticlesPresenterLike {}
