//
//  BookRecommendDetailRow.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI

/// 책정보 중복 컴포넌트
struct BookRecommendDetailRow: View {
    
    var title: String
    var value: String
    var width: CGFloat
    var height: CGFloat
    var alignment: Alignment
    var onOff: Bool
    
    init(title: String,
         value: String,
         width: CGFloat = 167,
         hegiht: CGFloat = 10,
         alignment: Alignment = .leading,
         onOff: Bool = false
    ) {
        self.title = title
        self.value = value
        self.width = width
        self.height = hegiht
        self.alignment = alignment
        self.onOff = onOff
    }
    
    var body: some View {
        HStack(alignment: .center, content: {
            VStack(content: {
                Text(title)
                    .font(.pretendard(type: .bold, size: 12))
                    .kerning(-0.2)
                    .foregroundStyle(Color.Font_Emphasize)
                
                if onOff {
                    Spacer()
                }
            })
            .frame(maxHeight: height)
            
            Text(value.split(separator: "").joined(separator: "\u{200B}"))
                .frame(maxWidth: width, maxHeight: height ,alignment: alignment)
                .font(.pretendard(type: .medium, size: 12))
                .kerning(-0.2)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.leading)
        })
        .frame(maxWidth: 209, maxHeight: height, alignment: .center)
    }
}
