//
//  MyQiitaArticlesView.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import Nuke
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
            collectionView.register(UINib(nibName: "ArticleListItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myArticleCVCell")
            
            collectionView.dataSource = self
            collectionView.delegate = self
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: collectionView.frame.width - 10, height: 200)
            flowLayout.minimumLineSpacing = 10
            
            collectionView.collectionViewLayout = flowLayout
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myArticleCVCell", for: indexPath) as? ArticleListItemCollectionViewCell,
              let article = presenterLike?.articles[indexPath.row] else {
            return .init()
        }
        
        cell.titleLabel.text = article.title
        cell.publisherNameLabel.text = article.user.name.isEmpty ? article.user.githubLoginName : article.user.name
        
        if let url = URL(string: article.user.profileImageUrl) {
            Nuke.loadImage(with: url, into: cell.publisherImageView)
        }
        
        return cell
    }
}

extension MyQiitaArticlesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenterLike?.navigateToAricleWebViewController(indexPath: indexPath)
    }
}

extension MyQiitaArticlesView: MyQiitaArticlesViewLike {
    func successGotMyQiitaArticles() {
        self.collectionView.reloadData()
    }
    
    func failedGettingMyQiitaArticles() {
        print("failed")
    }
}
