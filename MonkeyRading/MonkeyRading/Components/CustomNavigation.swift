//
//  CustomNavigation.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI

struct CustomNavigation: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
            
            Spacer()
            
            Text("상세 페이지")
                .font(.pretendard(type: .semiBold, size: 18))
                .foregroundStyle(Color.Font_General)
        }
        .frame(maxWidth: .infinity)
    }
    
    
}

#Preview {
    CustomNavigation()
}
