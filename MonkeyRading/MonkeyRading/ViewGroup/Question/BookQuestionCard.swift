//
//  BookQuestionCard.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

enum finish: String {
case no = "미답변"
case yes = "답변"
}


import SwiftUI
import Kingfisher

struct BookQuestionCard: View {
    
    let data: BookQuestionCardData
    
    init(data: BookQuestionCardData) {
        self.data = data
    }
    
    var body: some View {
        HStack(spacing: 16, content: {
            bookCover
            bookInfo
        })
    }
    
    @ViewBuilder
    private var bookCover: some View {
        if let url = URL(string: data.imageUrl) {
            KFImage(url)
                .placeholder {
                    ProgressView()
                        .frame(width: 100, height: 100)
                } .retry(maxCount: 2, interval: .seconds(2))
                .resizable()
                .frame(width: 90, height: 110)
                .clipShape(.rect(cornerRadius: 12))
        }
    }
    
    private var bookInfo: some View {
        VStack(alignment: .leading, content: {
            Text(data.bookName)
                .font(.large_Semibold)
                .foregroundStyle(Color.Font_Sub)
            Text(data.date)
                .font(.small_Medium)
                .foregroundStyle(Color.fontSub)
            
            Spacer()
            
            HStack {
                Text(data.finish)
                    .font(.small_Medium)
                    .foregroundStyle(data.finish == "미답변" ? Color.warningColor : Color.ColorMain)
                
                Button(action: {
                    print("답변하기")
                }, label: {
                    Text("답변하기")
                        .foregroundStyle(Color.white)
                        .frame(width: 81, height: 33)
                        .clipShape(.rect(cornerRadius: 6))
                        .background(Color.ColorMain)
                })
            }
        })
    }
}
