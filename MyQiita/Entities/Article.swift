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
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case renderedBody = "rendered_body"
        case url
        case updatedAt = "updated_at"
        case pageViewsCount = "page_views_count"
        case user
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.renderedBody = try container.decode(String.self, forKey: .renderedBody)
        self.url = try container.decode(String.self, forKey: .url)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.pageViewsCount = try container.decode(Int.self, forKey: .pageViewsCount)
        self.user = try container.decode(User.self, forKey: .user)
    }
}

