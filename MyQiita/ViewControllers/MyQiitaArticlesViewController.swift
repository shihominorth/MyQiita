//
//  ViewController.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import UIKit

protocol MyQiitaArticlesPresenter {
    <#requirements#>
}

class MyQiitaArticlesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        collectionView.register(ArticleListItemCollectionViewCell.self, forCellWithReuseIdentifier: "myArticleListItemCVCell")
    }
}

