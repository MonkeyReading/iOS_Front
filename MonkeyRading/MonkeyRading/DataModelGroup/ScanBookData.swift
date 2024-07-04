//
//  ScanBook.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation

struct ScanBookData: Codable {
    let documents: [Document]
    
    func toParameters() -> [String: Any] {
        guard let document = self.documents.first else {
            return [:]
        }
        
        let parameters: [String: Any] = [
            "isbn": document.isbn,
            "title": document.title,
            "author": document.authors.first ?? "",
            "cover": document.thumbnail,
            "price": document.price,
            "salePrice": document.salePrice,
            "content": document.contents,
            "purchaseLink": document.url
        ]
        
        return parameters.compactMapValues { $0 }
    }
}

// MARK: - Document
struct Document: Codable {
    let authors: [String]
    let contents: String
    let datetime: String
    let isbn: String
    let price: Int
    let publisher: String
    let salePrice: Int
    let status: String
    let thumbnail: String
    let title: String
    let translators: [String]
    let url: String

    enum CodingKeys: String, CodingKey {
        case authors, contents, datetime, isbn, price, publisher
        case salePrice = "sale_price"
        case status, thumbnail, title, translators, url
    }
}
