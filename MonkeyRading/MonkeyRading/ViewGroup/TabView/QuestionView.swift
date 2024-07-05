//
//  QuestionView.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var userState: UserState
    @StateObject var viewModel: QuestionViewModel = QuestionViewModel()
    
    var body: some View {
        VStack(spacing: -2, content: {
            backgroundView
            bookCardBackground
        })
    }
    
    private var backgroundView: some View {
        ZStack(alignment: .top, content: {
            Icon.backYello.image
                .resizable()
                .aspectRatio(contentMode: .fill)
            topInfor
        })
        .padding(.top, 30)
    }
    
    private var topInfor: some View {
        HStack(spacing: 15, content: {
            VStack(alignment: .leading, content: {
                Text("\(String(describing: userState.userName)) 어린이의")
                    .font(.yangji(type: .regular, size: 20))
                    .foregroundStyle(Color.Color_White)
                Text("질문 페이지에요!")
                    .font(.yangji(type: .regular, size: 20))
                    .foregroundStyle(Color.Font_Emphasize)
            })
            
            Icon.faceBook.image
                .fixedSize()
        })
    }
    
    private var bookCardBackground: some View {
        ScrollView(.vertical, content: {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0, maximum: 110)), count: 1), spacing: 20, content: {
                ForEach(viewModel.bookQuestionResponseData?.bookQuestion ?? [], id: \.self) { data in
                    BookQuestionCard(data: data)
                }
            })
        })
        .onAppear {
            viewModel.getQuestion()
        }
        .background(Color.white)
        .roundedCorner(20, corners: [.topLeft, .topRight])
        .shadow01()
        .frame(height: 800)
    }
}

#Preview {
    QuestionView()
}
