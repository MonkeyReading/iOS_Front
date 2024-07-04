//
//  NickNameViewModel.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import SwiftUI

struct NickNameView: View {
    
    @EnvironmentObject var userState: UserState
    @StateObject var viewModel: NickNameViewModel
    
    var body: some View {
        allView
    }
    
    private var allView: some View {
        VStack(alignment: .leading, spacing: 30) {
            
            Spacer()
            
            topTitle
            imageProfile
            inputUserData
            
            Spacer().frame(height: 40)
            
            nextBtn
        }
        .frame(width: 353)
        .sheet(isPresented: $viewModel.isImagePickerPresendted, content: {
            ShowImagePicker(imageHandler: viewModel)
        })
    }
    
    private var topTitle: some View {
        Text("정보를 \n입력해주세요")
            .frame(width: 188, height: 100, alignment: .leading)
            .font(.yangji(type: .regular, size: 20))
            .foregroundStyle(Color.Font_Emphasize)
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
        .frame(height: 200)
    }
    
    private var inputUserData: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            CustomTextField(title: "닉네임", placeholder: "닉네임을 입력해주세요", text: $viewModel.nickNameText)
            
            CustomTextField(title: "나이", placeholder: "나이를 입력해주세요", text: $viewModel.age)
        })
    }
    
    private var nextBtn: some View {
        Button(action: {
            if viewModel.beginBtn && viewModel.beginBtnTwo {
                viewModel.isProfileCompleted = true
                userState.updateName(userName: viewModel.nickNameText)
            }
        }, label: {
            ZStack {
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(viewModel.beginBtn && viewModel.beginBtnTwo ? Color.ColorMain : Color.Color_Button)
                    .frame(height: 54)
                    .shadow(color: Color(red: 0.62, green: 0.62, blue: 0.62).opacity(0.25), radius: 2, x: 0, y: 2)
                
                Text("확인")
                    .font(.pretendard(type: .semiBold, size: 16))
                    .foregroundStyle(Color.white)
            }
            
        })
    }
}

struct NickName_Preview: PreviewProvider {
    static var previews: some View {
        NickNameView(viewModel: NickNameViewModel())
    }
}
