//
//  AccessToken.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-23.
//

import Foundation

struct AccessToken: Codable {
    let clientId: String
    let scopes: [String]
    let token: String
}
