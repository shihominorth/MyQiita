//
//  User.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-23.
//

import Foundation

struct User: Decodable {
    let id: String
    let name: String
    let profileImageUrl: String
    let githubLoginName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profileImageUrl = "profile_image_url"
        case githubLoginName = "github_login_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)
        self.githubLoginName = try container.decode(String.self, forKey: .githubLoginName)
    }
}
