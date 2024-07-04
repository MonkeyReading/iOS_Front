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
    case smileFace = "smileFace"
    case KakaoBtn = "KakaoBtn"
    case baseProfile = "baseProfile"
    case clickHome = "clickHome"
    case clickBook = "clickBook"
    case clickBarcode = "clickBarcode"
    case clickQuestion = "clickQuestion"
    
    case barcode = "바코드"
    case book = "책"
    case home = "홈"
    case question = "질문"
    
    case guide = "guide"
    
    case Background = "Background"
    case human = "human"
    case bookPng = "bookPng"
    
    case ARIcon = "증강"
    // MARK: - Function
    var image: Image {
        return Image(self.rawValue)
    }
    
    // MARK: - TabFunction
    func icon(for isSelected: Bool) -> Image {
        let iconName = isSelected ? self.clickedIconName : self.rawValue
        return Image(iconName)
    }
    
    
    private var clickedIconName: String {
        switch self {
        case .home: return "clickHome"
        case .barcode: return "clickBarcode"
        case .book: return "clickBook"
        case .ARIcon: return "clickQuestion"

        default:
            return self.rawValue
        }
    }
    
    
}

