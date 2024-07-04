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
                                "title": "Brown Bear, Brown Bear, What Do You See?",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9780805047905.jpg"
                            },
                            {
                                "book_id": 2,
                                "title": "ANIMAL FARM",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788901163277.jpg"
                            },
                            {
                                "book_id": 3,
                                "title": "The Tale of Peter Rabbit",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg"
                            },
                            {
                                "book_id": 4,
                                "title": "The Lion and the Mouse",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/450D000039616.jpg"
                            },
                            {
                                "book_id": 5,
                                "title": "The Tale of Little Pig Robinson",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/480D170107920.jpg"
                            },
                            {
                                "book_id": 6,
                                "title": "An Adventure for Lia and Lion",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/480D230508830.jpg"
                            },
                            {
                                "book_id": 7,
                                "title": "The Sun and the Moon / The Tiger and the Traveler",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791195548682.jpg"
                            },
                            {
                                "book_id": 8,
                                "title": "Goodnight Moon",
                                "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9780064430173.jpg"
                            }
                        ]
                    }
                    """
            return Data(jsonData.utf8)
        }
    }
}
