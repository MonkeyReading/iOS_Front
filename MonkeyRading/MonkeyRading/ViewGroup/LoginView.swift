//
//  ContentView.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(content: {
            
            Spacer().frame(height: 100)
            
            topLogo
            
            Spacer().frame(height: 120)
            
            bottomButton
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea(.all)
        .background(Color.ColorMain)
        
    }
    
    private var topLogo: some View {
        VStack(spacing: 23, content: {
            upperLogin
            
            Icon.smileFace.image
                .fixedSize()
                .aspectRatio(contentMode: .fit)
        })
    }
    
    private var upperLogin: some View {
        VStack(alignment: .center, spacing: 5, content: {
            
            Text("몽키리딩")
                .font(.yangji(type: .regular, size: 32))
                .foregroundStyle(Color.Color_White)
                .kerning(-0.3)
            
            Text("어린이들을 위한 AR 영어 독서 교육")
                .foregroundStyle(Color.Font_Emphasize)
                .font(.yangji(type: .regular, size: 14))
                .kerning(-0.3)
        })
    }
    
    private var bottomButton: some View {
        Button(action: {
            print("카카오 버튼 클릭")
        }, label: {
            Icon.KakaoBtn.image
                .fixedSize()
        })
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
