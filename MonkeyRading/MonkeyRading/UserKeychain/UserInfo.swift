//
//  UserInfo.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//
import Foundation

struct UserInfo: Codable {
    var accessToken: String?
    var refreshToken: String?
    var nickname: String?
    var profileImageURL: String?
}

