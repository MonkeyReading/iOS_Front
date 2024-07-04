//
//  BookView.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI

struct BookSetView: View {
    @EnvironmentObject var userState: UserState
    @StateObject var viewModel: BookSetViewModel = BookSetViewModel()
    
    var body: some View {
        VStack(spacing: -2) {
            topView
            backgrounView
        }
        .frame(maxHeight: .infinity)
        .background(Color.ColorSub)
    }
    
    private var topView: some View {
        HStack(spacing: 10, content: {
            userData
            humanImage
        })
    }
    
    private var userData: some View {
        VStack(alignment: .leading, spacing: 5) {
            Icon.bookPng.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 60, maxHeight: 60)
            VStack(alignment: .leading, spacing: 2, content: {
                Text("\(userState.userName ?? "")어린이의")
                    .font(.yangji(type: .regular, size: 20))
                    .foregroundStyle(Color.ColorMain)
                Text("꿈과 함께 가득한 서재")
                    .font(.yangji(type: .regular, size: 20))
                    .foregroundStyle(Color.fontEmphasize)
            })
        }
    }
    
    private var humanImage: some View {
        Icon.human.image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 176, height: 239)
    }
    
    private var backgrounView: some View {
        ScrollView(.vertical, content: {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0, maximum: 286)), count: 2), spacing: 20, content: {
                ForEach(viewModel.bookSetData?.book_list ?? [], id: \.self) { data in
                    BookCard(data: data)
                }
            })
            .padding([.top, .bottom], 50)
        })
        .background(Color.white)
        .onAppear {
            viewModel.getBookList()
        }
        .padding(.bottom, 80)
        .roundedCorner(20, corners: [.topLeft, .topRight])
        .foregroundStyle(Color.white)
        .shadow03()
        .frame(height: 690)
            
    }
}

struct BookSetView_Preview: PreviewProvider {
    static var previews: some View {
        BookSetView()
    }
    
}
