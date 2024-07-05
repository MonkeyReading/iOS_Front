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
        return URL(string: "example")!
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
        return [
            "Content-Type": "application/json",
            "accept": "*/*"
        ]
    }
    
    var sampleData: Data {
        let json = """
           {
               "bookQuestion" : [
                   {
                       "imageUrl": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg",
                       "bookname": "The Tale of Peter Rabbit",
                       "date": "24/7/5",
                       "finish": "미답변"
                   }
               ]
           }
           """
        
        return Data(json.utf8)
    }
}
