//
//  loginViewModel.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/4/24.
//

import Foundation
import Moya

class LoginViewModel: ObservableObject {
    
    private let keyChainManager = KeyChainManager.standard
    private let tokenProvider: TokenProvider
    private let accessTokenRefresher: AccessTokenRefresher
    private let session: Session

    
    var provider: MoyaProvider<UserAPITarget>
    
    init() {
        tokenProvider = TokenProvider()
        accessTokenRefresher = AccessTokenRefresher(tokenProvider: tokenProvider)
        session = Session(interceptor: accessTokenRefresher)
        provider = MoyaProvider<UserAPITarget>(session: session)
    }
    
    private var loginManager = LoginManager()
    private var loginData: LoginResponseData?
    private var userInfo: UserInfo = UserInfo()
    
    
    public func loginKakao() {
        self.loginManager.kakaoLogin { [weak self] result in
            switch result {
            case .success(let oauthToken):
                print("액세스 토큰: \(oauthToken.accessToken)")
                self?.sendUserInfo(token: oauthToken.accessToken)
            case .failure(let error):
                print("로그인 실패: \(error)")
            }
        }
    }
    
    public func sendUserInfo(token: String) {
        provider.request(.userLogin(token: token)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleUserInfo(response: response)
            case .failure(let error):
                print("로그인 실패: \(error)")
            }
        }
    }
    
    /// 서버로 통신 성공시, 전달 받은 유저 정보 다루는 핸들러
    /// - Parameter response: 전달받은 유저 데이터(액세스, 리프레시) 토큰 값
    private func handleUserInfo(response: Response) {
        do {
            let decodedData = try JSONDecoder().decode(LoginResponseData.self, from: response.data)
            self.loginData = decodedData
            self.userInfo = UserInfo(accessToken: loginData?.accessToken, refreshToken: loginData?.refreshToken)
            
            let saveTrue = keyChainManager.saveSession(userInfo, for: "userSession")
            print("키체인 저장 \(saveTrue)")
            } catch {
            print("유저 정보 저장 에러: \(error)")
        }
    }
}
