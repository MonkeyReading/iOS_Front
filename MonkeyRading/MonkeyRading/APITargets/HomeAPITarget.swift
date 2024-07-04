//
//  HomeAPITarget.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation
import Moya

enum HomeAPITarget {
    case getHomeData
}

extension HomeAPITarget: TargetType {
    var baseURL: URL {
        return URL(string: "example")!
    }
    
    var path: String {
        switch self {
        case .getHomeData:
            return "/home/word"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHomeData:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getHomeData:
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
        case .getHomeData:
            let jsonData = """
{
 "word_list" : [
   {
     "word_id" : 1,
     "korean" : "강아지",
     "english" : "Dog",
     "image_url" : "https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_square.jpg?wp=1&w=272&h=272"
   },
   {
     "word_id" : 2,
     "korean" : "돼지",
     "english" : "pig",
     "image_url" : "https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_square.jpg?wp=1&w=272&h=272"
   },
   {
     "word_id" : 3,
     "korean" : "오리",
     "english" : "duck",
     "image_url" : "https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_square.jpg?wp=1&w=272&h=272"
   }
 ]
}

"""
            return Data(jsonData.utf8)
        }
    }
}
