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
        guard let url = URL(string: urlString) else {
            return
        }
       
        let urlRequest = URLRequest(url: url)
        
        self.load(urlRequest)
//        self.navigationDelegate = self
    }
}

//extension ArticleWebView: WKNavigationDelegate {
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//          webView.evaluateJavaScript("document.body.innerHTML", completionHandler: { (html, error) -> Void in
//              print(html)
//          })
//      }
//}
