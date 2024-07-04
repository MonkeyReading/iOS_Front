//
//  BookCard.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI
import Kingfisher

struct BookCard: View {
    
    let data: BookResponseData
    
    init(data: BookResponseData) {
        self.data = data
    }
    
    var body: some View {
        bookInfo
    }
    
    @ViewBuilder
    private var bookCover: some View {
        if let url = URL(string:data.image_url) {
            KFImage(url)
                .placeholder {
                    ProgressView()
                        .frame(width: 100, height: 100)
                } .retry(maxCount: 2, interval: .seconds(2))
                .resizable()
                .frame(width: 166, height: 211)
                .aspectRatio(contentMode: .fill)
                .clipShape(.rect(cornerRadius: 12))
                .shadow02()
        }
    }
    
    private var bookInfo: some View {
        VStack(spacing: 5, content: {
            bookCover
            Text(data.title)
                .font(.title3_Semibold)
                .foregroundStyle(Color.fontEmphasize)
                .frame(maxHeight: 63)
        })
        .frame(width: 188, height: 286)
    }
}

struct BookCard_PreView: PreviewProvider {
    static var previews: some View {
        BookCard(data: BookResponseData(book_id: 1, title: "BrownBear", image_url: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg"))
    }
}
