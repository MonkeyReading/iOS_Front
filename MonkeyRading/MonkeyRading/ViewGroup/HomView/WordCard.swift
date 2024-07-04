//
//  WordCard.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI
import Kingfisher

struct WordCard: View {
    
    var wordData: WordList
    
    init(wordData: WordList) {
        self.wordData = wordData
    }
    
    var body: some View {
        ZStack {
            backgroundView
            contentData
        }
        .frame(maxWidth: 168, maxHeight: 239)
    }
    
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.white)
            .frame(width: 168, height: 239)
            .clipShape(.rect(cornerRadius: 12))
            .shadow(color: Color(red: 0.42, green: 0.42, blue: 0.42).opacity(0.25), radius: 1, x: 0, y: 0)
    }
    
    private var contentData: some View {
        VStack(alignment: .leading, spacing: 12, content: {
            if let imageUrl = URL(string: wordData.image_url) {
                KFImage(imageUrl)
                    .placeholder {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }.retry(maxCount: 2, interval: .seconds(2))
                    .resizable()
                    .frame(width: 132, height: 150)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(.rect(cornerRadius: 12))
            }
            
            VStack(alignment: .leading, spacing: 5, content: {
                Text(wordData.english)
                    .font(.pretendard(type: .semiBold, size: 20))
                    .kerning(-0.3)
                    .foregroundStyle(Color.black)
                Text(wordData.korean)
                    .font(.large_Semibold)
                    .foregroundStyle(Color.Font_General)
            })
        })
        .frame(width: 132, height: 207)
    }
}

struct WordCard_Preview: PreviewProvider {
    static var previews: some View {
        WordCard(wordData: WordList(word_id: 1, korean: "돼지", english: "pig", image_url: "https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_square.jpg?wp=1&w=272&h=272"))
            .previewLayout(.sizeThatFits)
    }
}
