//
//  MyQiitaArticlesView.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import UIKit

protocol MyQiitaArticlesViewLike: ViewContainer {
    var presenterLike: MyQiitaArticlesPresenterLike? { get set }
    
    func successGotMyQiitaArticles()
    func failedGettingMyQiitaArticles()
}

final class MyQiitaArticlesView: XibView {
    weak var presenterLike: MyQiitaArticlesPresenterLike?
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(ArticleListItemCollectionViewCell.self, forCellWithReuseIdentifier: "myArticleCVCell")
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyQiitaArticlesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let articlesCount = presenterLike?.articles.count else {
            return 0
        }
        
        return articlesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myArticleCVCell", for: indexPath) as? ArticleListItemCollectionViewCell else {
            return .init()
        }
        
        
        
        return cell
    }
}

extension MyQiitaArticlesView: UICollectionViewDelegate {}

extension MyQiitaArticlesView: MyQiitaArticlesViewLike {
    func successGotMyQiitaArticles() {
        self.collectionView.reloadData()
    }
    
    func failedGettingMyQiitaArticles() {
        print("failed")
    }
}
