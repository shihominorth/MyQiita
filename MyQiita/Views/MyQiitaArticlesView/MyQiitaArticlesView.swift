//
//  MyQiitaArticlesView.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import UIKit

protocol MyQiitaArticlesViewLike: ViewContainer {
    var presenterLike: MyQiitaArticlesPresenterLike? { get set }
    
    func setSnapshot()
}

final class MyQiitaArticlesView: XibView {
    
    weak var presenterLike: MyQiitaArticlesPresenterLike?
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(ArticleListItemCollectionViewCell.self, forCellWithReuseIdentifier: "myArticleCVCell")
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

extension MyQiitaArticlesView: UICollectionViewDelegate {}

extension MyQiitaArticlesView: MyQiitaArticlesViewLike {
    func setSnapshot() {
        
    }
}
