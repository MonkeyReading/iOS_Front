//
//  Icon.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//
import Foundation
import SwiftUI

enum Icon: String {
    // MARK: - Login
    case logo = "logo"
    
    // MARK: - Function
    var image: Image {
        return Image(self.rawValue)
    }
}

