//
//  MonkeyRadingApp.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct MonkeyRadingApp: App {
    
    @StateObject private var userState = UserState()
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var profileViewModel = NickNameViewModel()
    
    init() {
        KakaoSDK.initSDK(appKey: "6a800afa4dbc24a46a0791cf71405699")
    }
    var body: some Scene {
        WindowGroup {
            if !loginViewModel.isLogin {
                LoginView(viewModel: loginViewModel)
            } else if !profileViewModel.isProfileCompleted {
                NickNameView(viewModel: profileViewModel)
                    .environmentObject(userState)
            } else {
                MonkeyTapView()
                    .environmentObject(userState)
            }
        }
    }
}
