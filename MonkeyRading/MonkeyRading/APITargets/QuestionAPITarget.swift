//
//  QuestionAPITarget.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation
import Moya

enum QuestionAPITarget {
    case getQuestion
}

extension QuestionAPITarget: TargetType {
    
    
    var baseURL: URL {
        return URL(String: "example")!
    }
    
    var path: String {
        switch self {
        case .getQuestion:
            return "/question"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getQuestion:
            .get
        }
    }
    
    var task: Task {
        switch self {
        case .getQuestion:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        var headers: [String: String]? {
            return [
                "Content-Type": "application/json",
                "accept": "*/*"
            ]
        }
    }
    
    var sampleData: Data {
        let json = """
"""
        
        return Data(json.utf8)
    }
}
