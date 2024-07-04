//
//  CustomTextField.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import SwiftUI

struct CustomTextField: View {
    
    var title: String
    var placeholder: String
    @Binding var text: String
    @FocusState private var isTextFocused: Bool
    
    init(
        title: String,
        placeholder: String,
        text: Binding<String>,
        isTextFocused: Bool = false
    ) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
    }
    
    
    var body: some View {
        textFileGroup
    }
    
    private var textFileGroup: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(text.isEmpty ? Color.black : Color.warningColor, lineWidth: 1)
            
            customTextField
        })
        .frame(width: 353, height: 80)
    }
    
    private var placeholderInField: some View {
        Text(placeholder)
            .font(.small_Semibold)
            .foregroundStyle(Color.gray)
            .onTapGesture {
                isTextFocused = true
            }
            .padding(.leading, 20)
        
    }
    
    private var customTextField: some View {
        ZStack(alignment: .leading, content: {
            
            if text.isEmpty && !isTextFocused {
                placeholderInField
            }
            
            TextField("", text: $text, axis: .horizontal)
                .frame(width: 330, height: 80)
                .font(.regular_Medium)
                .foregroundStyle(Color.black)
                .focused($isTextFocused)
                .padding(.leading, 20)
                .background(Color.clear)
                .clipShape(.rect(cornerRadius: 12))
                .onTapGesture {
                    if !isTextFocused {
                        text = ""
                        isTextFocused = true
                    }
                }
        })
    }
}

struct CustomeTextField_Preview: PreviewProvider {
    
    static var previews: some View {
        @State var text = ""
        CustomTextField(title: "닉네임", placeholder: "닉네임을 입력해주셍", text: $text)
    }
}
