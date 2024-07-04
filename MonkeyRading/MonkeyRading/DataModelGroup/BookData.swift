//
//  BookData.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation

struct BookData: Codable {
    var isbn: String
    var title: String
    var summary: String
    var publisher: String
    var thumbnail: String
    var author: String
}
