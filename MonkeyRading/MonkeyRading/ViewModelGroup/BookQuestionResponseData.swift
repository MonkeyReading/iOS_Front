//
//  BookQuestionResponseData.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation

struct BookQuestionResponseData:  Codable {
    var bookQuestion: [BookQuestionData]
}

struct BookQuestionData: Codable, Hashable {
    var imageUrl: String
    var bookname: String
    var date: String
    var finish: String
}
