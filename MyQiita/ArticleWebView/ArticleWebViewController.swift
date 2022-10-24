//
//  ArticleWebViewController.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-24.
//

import UIKit

protocol ArticleWebPresenterLike: AnyObject {
    
}

class ArticleWebViewController: UIViewController {
    private let viewContainer: ArticleWebViewLike
    private let model: ArticleWebModel
    private let urlString: String
    
    init(viewContainer: ArticleWebViewLike = ArticleWebView(),
         model: ArticleWebModel = ArticleWebModelImpl(),
         urlString: String) {
        self.viewContainer = viewContainer
        self.model = model
        self.urlString = urlString
        
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
        
        edgesForExtendedLayout = []
        viewContainer.load(urlString: urlString)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
