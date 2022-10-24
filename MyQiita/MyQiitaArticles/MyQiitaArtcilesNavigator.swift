//
//  MyQiitaArtcilesNavigator.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-24.
//

import UIKit

protocol MyQiitaArticlesNavigatorLike: AnyObject {
    func presentAuthorizeMyQiitaViewController(on viewController: UIViewController)
    func showAlert(on viewController: UIViewController)
}

class MyQiitaArticlesNavigator: MyQiitaArticlesNavigatorLike {
    func presentAuthorizeMyQiitaViewController(on viewController: UIViewController) {
        let authorizeMyQiitaViewController: AuthorizeMyQiitaViewController = {
            let viewContainer = AuthorizeMyQiitaView()
            let model = AuthorizeMyQiitaImpl()
            
            return AuthorizeMyQiitaViewController(viewContainer: viewContainer, model: model)
        }()
        
        viewController.present(authorizeMyQiitaViewController, animated: true)
    }
    
    func showAlert(on viewController: UIViewController) {
        let alertViewController = UIAlertController(title: "エラー発生しました", message: nil, preferredStyle: .alert)
        
        viewController.present(alertViewController, animated: true)
    }
}
