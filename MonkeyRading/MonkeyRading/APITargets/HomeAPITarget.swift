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
    case sentenceData
}

extension HomeAPITarget: TargetType {
    var baseURL: URL {
        return URL(string: "example")!
    }
    
    var path: String {
        switch self {
        case .getHomeData:
            return "/home/word"
        case .sentenceData:
            return "/home/sentence"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHomeData:
            return .get
        case .sentenceData:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getHomeData:
            return .requestPlain
        case .sentenceData:
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
     "image_url" : "https://blog.kakaocdn.net/dn/kO2MD/btsvXjnKfCD/FXj1WJHyXSZo2cSr4DKgV0/img.jpg"
   },
   {
     "word_id" : 2,
     "korean" : "돼지",
     "english" : "pig",
     "image_url" : "https://search1.kakaocdn.net/argon/0x200_85_hr/DcDWLqDx3MS"
   },
   {
     "word_id" : 3,
     "korean" : "오리",
     "english" : "duck",
     "image_url" : "https://t1.daumcdn.net/cafeattach/1Yeqd/d39b944d6be02c7225f5785a1d28905694a1bf25"
   },
   {
     "word_id" : 4,
     "korean" : "말",
     "english" : "horse",
     "image_url" : "https://blog.kakaocdn.net/dn/B6h9G/btrNFSG05C2/Ta7E46JHlmu983ly0cAEzK/img.png"
   },
   {
     "word_id" : 5,
     "korean" : "양",
     "english" : "sheep",
     "image_url" : "https://t1.daumcdn.net/cfile/tistory/9987B0385EC0CC5F1D"
   },{
     "word_id" : 6,
     "korean" : "코끼리",
     "english" : "elephant",
     "image_url" : "http://cfile291.uf.daum.net/image/99025F3D5BEF2C151F50C8"
   }
 ]
}

"""
            return Data(jsonData.utf8)
            
        case .sentenceData:
            let jsonData = """
{
"sentence_list" : [
{
"sentence_id" : 1,
"title": "바람과함꼐 사라지다",
"quote": "asadasdasddsadd",
"image_url" : "https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_square.jpg?wp=1&w=272&h=272"
},
{
"sentence_id" : 2,
"title": "돈의속성",
"quote": "ㅁㄴㅇㄴㅁㅇㅁㅁㅇㄴㅇㄴㅇㄴㅇ",
"image_url" : "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg"
},
P
]
}
"""
            return Data(jsonData.utf8)
        }
    }
}
