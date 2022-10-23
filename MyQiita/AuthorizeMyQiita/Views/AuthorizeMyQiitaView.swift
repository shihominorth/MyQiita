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
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension AuthorizeMyQiitaViewLike {
    
}
