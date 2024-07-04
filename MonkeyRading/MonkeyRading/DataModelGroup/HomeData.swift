//
//  HomeData.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation

struct HomeResponseData: Codable {
    var word_list: [WordList]
}

struct WordList: Codable, Hashable {
    var word_id: Int
    var korean: String
    var english: String
    var image_url: String
}

struct HomeSentenceData: Codable {
    var sentence_list: [SentenceList]
}

struct SentenceList: Codable, Hashable {
    var bookUrl: String
    var bookName: String
    var bookSentence: String
}
