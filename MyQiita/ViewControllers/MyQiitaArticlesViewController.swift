//
//  ViewController.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import UIKit

protocol MyQiitaArticlesPresenterLike {
    
}

class MyQiitaArticlesViewController: UIViewController {
    private let viewContainer: MyQiitaArticlesViewLike
    private let model: MyQiitaArticlesModel
    
    init(viewContainer: MyQiitaArticlesViewLike, model: MyQiitaArticlesModel) {
        self.viewContainer = viewContainer
        self.model = model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewContainer.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
   
}

