//
//  SentenceCard.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI
import Kingfisher

struct SentenceCard: View {
    
    let sentenceData: SentenceList
    
    init(sentenceData: SentenceList) {
        self.sentenceData = sentenceData
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            backgroudView
            bookSentenceData
        }
    }
    
    private var backgroudView: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(Color.white)
            .frame(width: 354, height: 142)
            .clipShape(.rect(cornerRadius: 8))
            .shadow(color: Color(red: 0.42, green: 0.42, blue: 0.42).opacity(0.25), radius: 1, x: 0, y: 0)
    }
    
    private var bookSentenceData: some View {
        HStack(spacing: 16, content: {
            if let imageUrl = URL(string: sentenceData.bookUrl) {
                KFImage(imageUrl)
                    .placeholder{
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }.retry(maxCount: 2, interval: .seconds(2))
                    .resizable()
                    .frame(width: 90, height: 110)
                    .clipShape(.rect(cornerRadius: 8))
            }
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text(sentenceData.bookName)
                    .font(.large_Semibold)
                    .foregroundStyle(Color.Font_Emphasize)
                    .lineLimit(nil)
                
                Text(sentenceData.bookSentence)
                    .font(.regular_Medium)
                    .foregroundStyle(Color.Font_Sub)
                    .lineLimit(nil)
            })
            .frame(width: 216, height: 100)
        })
    }
}

struct SentenceCard_Preview:PreviewProvider {
    static var previews: some View {
        SentenceCard(sentenceData: SentenceList(bookUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791188331796.jpg", bookName: "Brown Bear, Brown Bear, What Do You See?", bookSentence: "“Brown Bear, Brown Bear, What do you see?”, “I see a red bird looking at me.”"))
    }
}
