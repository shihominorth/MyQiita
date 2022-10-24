//
//  ArticleWebView.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-24.
//

import UIKit
import WebKit

protocol ArticleWebViewLike: ViewContainer {
    func load(urlString: String)
}

class ArticleWebView: WKWebView {
}

extension ArticleWebView: ArticleWebViewLike {
    func load(urlString: String) {
        <#code#>
    }
}
