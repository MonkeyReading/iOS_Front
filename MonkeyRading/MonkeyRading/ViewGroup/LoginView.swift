//
//  ContentView.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 22, content: {
            Icon.smileFace.image
                .fixedSize()
                .aspectRatio(contentMode: .fit)
        })
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
