//
//  LoginData.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import Foundation


struct LoginData: Codable {
    var auth_code: String
}

struct LoginResponseData: Codable {
    var access_token: String
    var refresh_token: String
}
