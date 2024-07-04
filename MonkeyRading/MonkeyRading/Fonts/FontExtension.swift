//
//  FontExtension.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import Foundation
import SwiftUI

extension Font {
    
    enum Pretendard {
        case bold
        case semiBold
        case black
        case light
        case medium
        case regular
        
        var value: String {
            switch self {
            case .bold:
                return "Pretendard-Bold"
            case .black:
                return "Pretendard-Black"
            case .semiBold:
                return "Pretendard-SemiBold"
            case .light:
                return "Pretendard-Light"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            }
        }
        
    }
    
    enum YANGJIN {
        case regular
        
        var value: String {
            switch self {
            case .regular:
                return "YANGJIN"
            }
        }
    }
    
    static func pretendard(type: Pretendard, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    static func yangji(type: YANGJIN, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    // MARK: - Small
    
    static var small_Regualr: Font {
        return .pretendard(type: .regular, size: 12)
    }
    
    static var small_Medium: Font {
        return .pretendard(type: .medium, size: 12)
    }
    
    static var small_Semibold: Font {
        return .pretendard(type: .semiBold, size: 12)
    }
    
    // MARK: - Regular
    
    static var regular_Regular: Font {
        return .pretendard(type: .regular, size: 14)
    }
    
    static var regular_Medium: Font {
        return .pretendard(type: .medium, size: 14)
    }
    
    static var regular_Semibold: Font {
        return .pretendard(type: .semiBold, size: 14)
    }
    
    
    // MARK: - Large
    
    static var large_Regular: Font {
        return .pretendard(type: .regular, size: 16)
    }
    
    static var large_Medium: Font {
        return .pretendard(type: .medium, size: 16)
    }
    
    static var large_Semibold: Font {
        return .pretendard(type: .semiBold, size: 16)
    }
    
    // MARK: - Title3
    
    static var title3_Regular: Font {
        return .pretendard(type: .regular, size: 18)
    }
    
    static var title3_Medium: Font {
        return .pretendard(type: .medium, size: 18)
    }
    
    static var title3_Semibold: Font {
        return .pretendard(type: .semiBold, size: 18)
    }
    
}
