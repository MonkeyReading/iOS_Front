//
//  TapView.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI

struct TapView: View {
    
    @EnvironmentObject var userState: UserState
    @State private var slectedTab: MonkeyReadingTab = .homeTab
    @State private var opacity = 0.0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TapView()
}
