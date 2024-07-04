//
//  LoginData.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import Foundation


struct LoginData: Codable {
    var access_Token: String
}

struct LoginResponseData: Codable {
    var accessToken: String
    var refreshToken: String
}
