//
//  NickNameViewModel.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import Foundation
import Moya
import UIKit

class NickNameViewModel: ObservableObject, ImageHandling {
    
    
    private let keyChainManager = KeyChainManager.standard
    
    var provider: MoyaProvider<UserAPITarget>
    @Published public var isProfileCompleted: Bool
    
    init(
        provider: MoyaProvider<UserAPITarget> = APIManager.shared.createProvider(for: UserAPITarget.self),
        isProfileCompleted: Bool = false) {
            self.provider = provider
            self.isProfileCompleted = isProfileCompleted
        }
    
    // MARK: - NicknameProperty
    /// 입력한 닉네임 길이
    @Published public var nickNameText: String = "" {
        didSet {
            if nickNameText.count >= 2 {
                beginBtn = true
            } else {
                beginBtn = false
            }
        }
    }
    
    
    // MARK: - btnProperty
    /// 시작하기 버튼 활성화 여부 판단
    @Published public var beginBtn: Bool = false
    
    // MARK: - ImageProperty
    /// 이미지 피커 선택되었는가?
    @Published var isImagePickerPresendted: Bool = false
    
    
    @Published private var profileImageData: Data?
    
    // MARK: - ProfileImaegHandle
    var selectedImage: UIImage?
    
    /// 선택한 이미지 추가
    /// - Parameter images: 선택한 이미지 UIImage 타입으로 저장
    public func addImage(_ images: UIImage?) {
        if let image = images {
            selectedImage = image
        }
    }
    
    /// 이미지 피커 불러오기
    public func showImagePicker() {
        isImagePickerPresendted.toggle()
    }
    

}
