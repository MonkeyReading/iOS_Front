//
//  UserAPITarget.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import Foundation
import Moya

/// 유저 정보로그인
enum UserAPITarget {
    case userLogin(token: String)
    case userProfile
}

extension UserAPITarget: TargetType {
    
    var baseURL: URL {
        return URL(string: "example")!
    }
    
    var path: String {
        switch self {
        case .userLogin:
            return "/auth/kakao"
        case .userProfile:
            return "/user/updateProfile"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .userLogin:
            return .post
        case .userProfile:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .userLogin(let token):
            return .requestParameters(parameters: ["authorizationCode": token], encoding: URLEncoding.queryString)
        case .userProfile:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
           return ["accept": "*/*"]
       }
}
