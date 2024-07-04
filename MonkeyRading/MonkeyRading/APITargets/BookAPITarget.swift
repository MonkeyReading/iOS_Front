//
//  BookAPITarget.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation
import Moya

enum BookAPITarget {
    case getBookList
}

extension BookAPITarget: TargetType {
    var baseURL: URL {
        return URL(string: "example")!
    }
    var path: String {
        switch self {
        case .getBookList:
            return "/home/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBookList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getBookList:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "accept": "*/*"
        ]
    }
    
    var sampleData: Data {
        switch self {
        case .getBookList:
            let jsonData = """
{
book_list : [
{
book_id : int,
title : string,
image_url : string
},
{
book_id : int,
title : string,
image_url : string
},
{
book_id : int,
title : string,
image_url : string
}
]
}
"""
            return Data(jsonData.utf8)
        }
    }
}
