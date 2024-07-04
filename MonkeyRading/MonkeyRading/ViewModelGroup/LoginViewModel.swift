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
    var provider: MoyaProvider<UserAPITarget>
    
    init(
        provider: MoyaProvider<UserAPITarget> = APIManager.shared.createProvider(for: UserAPITarget.self)
    ) {
        self.provider = provider
    }
    
    private var loginManager = LoginManager()
    private var loginData: LoginResponseData?
    private var userInfo: UserInfo = UserInfo()
    @Published public var isLogin: Bool = false
    
    
    public func loginKakao() {
        self.loginManager.kakaoLogin { [weak self] result in
            switch result {
            case .success(let oauthToken):
                print("액세스 토큰: \(oauthToken.accessToken)")
                self?.isLogin = true
                self?.sendUserInfo(token: oauthToken.accessToken)
            case .failure(let error):
                print("로그인 실패: \(error)")
            }
        }
    }
    
    private func sendUserInfo(token: String) {
        provider.request(.userLogin(token: token)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleUserInfo(response: response)
            case .failure(let error):
                print("로그인 실패: \(error)")
            }
        }
    }
    
    private func handleUserInfo(response: Response) {
        do {
            let decodedData = try JSONDecoder().decode(LoginResponseData.self, from: response.data)
            self.loginData = decodedData
            self.userInfo = UserInfo(accessToken: loginData?.access_token, refreshToken: loginData?.refresh_token)
            
            let saveTrue = keyChainManager.saveSession(userInfo, for: "userSession")
            print("키체인 저장 \(saveTrue)")
        } catch {
            print("유저 정보 저장 에러: \(error)")
        }
    }
}
