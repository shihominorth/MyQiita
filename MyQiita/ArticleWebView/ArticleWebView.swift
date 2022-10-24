//
//  ArticleWebView.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-24.
//

import UIKit
import WebKit

protocol ArticleWebViewLike: ViewContainer {
    func load(html: String)
}

class ArticleWebView: WKWebView {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension ArticleWebView: ArticleWebViewLike {
    func load(html: String) {
        self.loadHTMLString(html, baseURL: nil)
    }
}
