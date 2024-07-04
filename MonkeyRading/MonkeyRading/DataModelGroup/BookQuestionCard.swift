//
//  BookQuestionCard.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation

struct BookQuestionResponseData: Codable {
    var bookData: [BookQuestionCardData]
}

struct BookQuestionCardData: Codable, Hashable {
    var imageUrl: String
    var bookName: String
    var date: String
    var finish: String
}
