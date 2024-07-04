//
//  ContentView.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("world!")
                .font(.yangji(type: .regular, size: 16))
        }
        .padding()
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
