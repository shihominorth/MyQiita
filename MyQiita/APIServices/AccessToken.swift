//
//  AccessToken.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-23.
//

import Foundation

struct AccessToken: Decodable {
    let clientId: String
    let scopes: [String]
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
        case scopes
        case token
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.scopes = try container.decode([String].self, forKey: .scopes)
        self.token = try container.decode(String.self, forKey: .token)
    }
}
