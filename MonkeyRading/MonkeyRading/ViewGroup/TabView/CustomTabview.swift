//
//  CustomTabview.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import SwiftUI


struct CustomTabView: View {
    
    @Binding var selectedTab: MonkeyReadingTab
    @StateObject var keyboardObserver = KeyboardObserver()
    
    var body: some View {
        GeometryReader { geo in
            if !keyboardObserver.isKeyboardVisible {
                HStack {
                    ForEach(MonkeyReadingTab.allCases, id: \.rawValue) { tab in
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.spring()) {
                                selectedTab = tab
                            }
                        } label: {
                            VStack(spacing: 4) {
                                Icon(rawValue: tab.rawValue)?
                                    .icon(for: selectedTab == tab)
                                    .fixedSize()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(selectedTab == tab ? Color.ColorMain : Color.Font_Disable)
                                
                                Text(tab.rawValue)
                                    .font(.yangji(type: .regular, size: 8))
                                    .foregroundStyle(selectedTab == tab ? Color.ColorMain : Color.Font_Disable)
                            }
                        }
                        
                        Spacer()
                    }
                }
                .frame(width: geo.size.width, height: 90)
                .ignoresSafeArea(.keyboard)
                .background(Color.white)
                .roundedCorner(20, corners: [.topLeft, .topRight])
                .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: -1)
                .ignoresSafeArea(.keyboard)
                .position(x: geo.size.width / 2, y: geo.size.height * 0.99)
            }

        }
    }
}

struct CustomTabview_PreView: PreviewProvider {
    static var previews: some View {
        @State var selectedTab: MonkeyReadingTab = .homeTab
        CustomTabView(selectedTab: $selectedTab)
    }
}
