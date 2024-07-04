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
                        "book_list": [
                            {
                                "book_id": 1,
                                "title": "홍길동전",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg"
                            },
                            {
                                "book_id": 2,
                                "title": "홍길동전",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg"
                            },
                            {
                                "book_id": 3,
                                "title": "홍길동전",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg"
                            }
                        ]
                    }
                    """
            return Data(jsonData.utf8)
        }
    }
}
