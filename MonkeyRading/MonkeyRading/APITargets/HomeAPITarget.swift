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
   },
    {
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
    "sentence_list": [
        {
            "sentence_id": 1,
            "title": "Brown Bear, Brown Bear, What Do You See?",
            "quote": "Brown Bear, Brown Bear, What do you see? I see a red bird looking at me.",
            "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9780805047905.jpg"
        },
        {
            "sentence_id": 2,
            "title": "ANIMAL FARM",
            "quote": "Brown Bear, Brown Bear, What do you see? I see a red bird looking at me.",
            "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788901163277.jpg"
        },
        {
            "sentence_id": 3,
            "title": "The Tale of Peter Rabbit",
            "quote": "Once upon a time there were four little Rabbits, and their names were Flopsy, Mopsy, Cotton-tail, and Peter.",
            "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg"
        },
        {
            "sentence_id": 4,
            "title": "The Lion and the Mouse",
            "quote": "The lion was so tickled by the idea of the mouse helping him that he lifted his paw and let him go.",
            "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/450D000039616.jpg"
        },
        {
            "sentence_id": 5,
            "title": "The Tale of Little Pig Robinson",
            "quote": "Little Pig Robinson saw the world beyond his little island for the first time.",
            "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/480D170107920.jpg"
        },
        {
            "sentence_id": 6,
            "title": "An Adventure for Lia and Lion",
            "quote": "Lia and her lion friend embarked on a journey across the vast savannah.",
            "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/480D230508830.jpg"
        },
        {
            "sentence_id": 7,
            "title": "The Sun and the Moon / The Tiger and the Traveler",
            "quote": "The tiger watched the traveler cautiously, its eyes gleaming in the dark.",
            "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791195548682.jpg"
        },
        {
            "sentence_id": 8,
            "title": "Goodnight Moon",
            "quote": "Goodnight room. Goodnight moon. Goodnight cow jumping over the moon.",
            "image_url": "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9780064430173.jpg"
        }
    ]
}
"""
            return Data(jsonData.utf8)
        }
    }
}
