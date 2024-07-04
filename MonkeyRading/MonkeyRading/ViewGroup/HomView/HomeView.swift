//
//  HomeView.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userState: UserState
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical, content: {
            VStack(spacing: 20, content: {
                ZStack(alignment: .topLeading, content: {
                    Icon.Background.image
                    VStack(alignment: .leading, content: {
                        
                        Spacer().frame(height: 100)
                        
                        Text("어서오세요!")
                            .font(.yangji(type: .regular, size: 20))
                            .foregroundStyle(Color.ColorDisable)
                        Text("\(userState.userName ?? "") 어린이!")
                            .font(.yangji(type: .regular, size: 20))
                            .foregroundStyle(Color.ColorMain)
                    })
                    .padding(.leading, 40)
                })
                
                lastWord
                lastSentence
            })
            .padding(.horizontal, 10)
        })
        .frame(maxHeight: .infinity).ignoresSafeArea(.all)
 
    }
    
    private var lastWord: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("최근에 공부한 단어에요!")
                .font(.yangji(type: .regular, size: 18))
                .foregroundStyle(Color.Font_Emphasize)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0, maximum: 239)), count: 2), spacing: 14, content: {
                ForEach(viewModel.homeResponseData?.word_list ?? [], id: \.self) { data in
                    WordCard(wordData: data)
                }
            })
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .refreshable {
                print("리프레시 진행")
                viewModel.getWordList()
                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                    viewModel.getWordList()
                }
            }
        }
        .onAppear {
            viewModel.getWordList()
        }
    }
    
    private var lastSentence: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("최근에 저장한 구절이에요!")
                .font(.yangji(type: .regular, size: 18))
                .foregroundStyle(Color.Font_Emphasize)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0, maximum: 142)), count: 1), content: {
                ForEach(viewModel.sentenceData?.sentence_list ?? [], id: \.self) { data in
                    SentenceCard(sentenceData: data)
                }
            })
            .padding(.horizontal, 15)
            .padding(.bottom, 100)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .refreshable {
                print("리프레시 진행")
                viewModel.getWordList()
                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                    viewModel.getWordList()
                }
            }
        }
        .onAppear {
            viewModel.getSentence()
        }
    }
}

#Preview {
    HomeView()
}
