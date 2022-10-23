//
//  Article.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-23.
//

import Foundation

struct Article: Decodable {
    let id: String
    let title: String
    let renderedBody: String
    let url: String
    let updatedAt: String
    let pageViewsCount: Int
    let publisher: User
}

