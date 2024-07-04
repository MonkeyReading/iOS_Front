//
//  BookSetData.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation

struct BookSetData: Codable {
    var book_list: [BookResponseData]
}

struct BookResponseData: Codable {
    var book_id: Int
    var title: String
    var image_url: String
}
