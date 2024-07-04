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
            
        case .sentenceData:
            let jsonData = """
{
"sentence_list" : [
{
"sentence_id" : 1,
"title": "Brown Bear, Brown Bear, What Do You See?",
"quote": “Brown Bear, Brown Bear, What do you see?”, “I see a red bird looking at me.”,
"image_url" : "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9780805047905.jpg"
},
{
"sentence_id" : 2,
"title": "ANIMAL FARM",
"quote": "“Brown Bear, Brown Bear, What do you see?”, “I see a red bird looking at me.”",
"image_url" : "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788901163277.jpg"
}
]
},
{
"sentence_id" : 3,
"title": "The Tale of Peter Rabbit",
"quote": "Once upon a time there were four little Rabbits, and their names were Flopsy, Mopsy, Cotton-tail, and Peter.",
"image_url" : "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg"
}
]
},
{
"sentence_id" : 4,
"title": "The Lion and the Mouse",
"quote": "The lion was so tickled by the idea of the mouse helping him that he lifted his paw and let him go.",
"image_url" : "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/450D000039616.jpg"
}
]
},
{
"sentence_id" : 5,
"title": "The Tale of Little Pig Robinson",
"quote": "Little Pig Robinson saw the world beyond his little island for the first time.",
"image_url" : "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/480D170107920.jpg"
}
]
},
{
"sentence_id" : 6,
"title": "An Adventure for Lia and Lion",
"quote": "Lia and her lion friend embarked on a journey across the vast savannah.",
"image_url" : "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/480D230508830.jpg"
}
]
},
{
"sentence_id" : 7,
"title": "The Sun and the Moon / The Tiger and the Traveler",
"quote": "The tiger watched the traveler cautiously, its eyes gleaming in the dark.",
"image_url" : "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791195548682.jpg"
}
]
},
{
"sentence_id" : 8,
"title": "Goodnight Moon",
"quote": "Goodnight room. Goodnight moon. Goodnight cow jumping over the moon.",
"image_url" : "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9780064430173.jpg"
}
]
}
"""
            return Data(jsonData.utf8)
        }
    }
}
