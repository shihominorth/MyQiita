//
//  AuthorizeMyQiitaView.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-23.
//

import UIKit

protocol AuthorizeMyQiitaViewLike: ViewContainer {
    var presenterLike: AuthorizeMyQiitaPresenter? { get set }
    
}

class AuthorizeMyQiitaView: XibView {
    weak var presenterLike: AuthorizeMyQiitaPresenter?

    @IBOutlet weak var greetingLabel: UILabel! {
        didSet {
            greetingLabel.text = "さあ、MyQiitaを始めよう！"
        }
    }
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
            loginButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            loginButton.setTitleColor(UIColor.white, for: .normal)
            loginButton.layer.masksToBounds = true
            loginButton.layer.cornerRadius = 10
            loginButton.addTarget(self, action: #selector(didPressedLoginButton), for: .touchUpInside)
        }
    }
    
    @objc func didPressedLoginButton() {
        presenterLike?.openAuthorizeUrl()
    }
}

extension AuthorizeMyQiitaView: AuthorizeMyQiitaViewLike {
}
