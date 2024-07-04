//
//  NickNameViewModel.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import SwiftUI

struct NickNameView: View {
    
//    @EnvironmentObject var userState: UserState
    @StateObject var viewModel: NickNameViewModel
    

    
    var body: some View {
        allView
    }
    
    private var allView: some View {
        VStack(alignment: .leading, spacing: 52) {
            topTitle
            imageProfile
        }
        .frame(width: 353)
    }
    
    private var topTitle: some View {
        Text("정보를 \n입력해주세요")
            .font(.yangji(type: .regular, size: 20))
            .foregroundStyle(Color.black)
            .lineSpacing(21)
            .kerning(-0.3)
    }
    
    private var imageProfile: some View {
        HStack {
            
            Spacer()
            
            
            Button(action: {
                viewModel.showImagePicker()
            }, label: {
                if let selectedImage = viewModel.selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 200, maxHeight: 200)
                        .clipShape(Circle())
                } else {
                    Icon.baseProfile.image
                        .fixedSize()
                        .aspectRatio(contentMode: .fit)
                }
            })
            
            Spacer()
        }
    }
    
    
    
    
}

struct NickName_Preview: PreviewProvider {
    static var previews: some View {
        NickNameView(viewModel: NickNameViewModel())
    }
}
