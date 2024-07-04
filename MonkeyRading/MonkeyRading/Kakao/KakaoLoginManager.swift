//
//  KakaoLoginManager.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser

class KakaoLoginManager: ObservableObject {
    fileprivate func handleLoginResponse(oauthToken: OAuthToken?, error: Error?, completion: @escaping (Result<OAuthToken, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else if let oauthToken = oauthToken {
            completion(.success(oauthToken))
        }
    }
    
    internal func kakaoLogin(completion: @escaping (Result<OAuthToken, Error>) -> Void) {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { [weak self] (oathToken, error) in
                self?.handleLoginResponse(oauthToken: oathToken, error: error, completion: completion)
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { [weak self] (oauthToken, error) in
                self?.handleLoginResponse(oauthToken: oauthToken, error: error, completion: completion)
            }
        }
    }
}

