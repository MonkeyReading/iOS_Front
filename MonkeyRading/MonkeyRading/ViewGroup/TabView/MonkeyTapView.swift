//
//  TapView.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI

struct MonkeyTapView: View {
    
    @EnvironmentObject var userState: UserState
    @State private var selectedTab: MonkeyReadingTab = .homeTab
    @State private var opacity = 0.0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Icon.home.image
                            .fixedSize()
                            .aspectRatio(contentMode: .fit)
                    }
                    .tag(MonkeyReadingTab.homeTab)
                    .environmentObject(userState)
                

                
                ISBNCameraView()
                    .tabItem {
                        Icon.barcode.image
                            .fixedSize()
                            .aspectRatio(contentMode: .fit)
                    }
                    .tag(MonkeyReadingTab.barcode)
                
                BookSetView()
                    .tabItem {
                        Icon.bookPng.image
                            .fixedSize()
                            .aspectRatio(contentMode: .fit)
                    }
                    .tag(MonkeyReadingTab.book)
                    .environmentObject(userState)
                
                ContentView()
                    .tabItem {
                        Icon.ARIcon.image
                            .fixedSize()
                            .aspectRatio(contentMode: .fit)
                    }
                    .tag(MonkeyReadingTab.ar)
            }
            
            
            CustomTabView(selectedTab: $selectedTab)
        })
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.75)) {
                self.opacity = 1.0
            }
        }
    }
}
