//
//  HomeViewModel.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation
import Moya
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var homeResponseData: HomeResponseData?
    @Published var sentenceData: HomeSentenceData?
    
    private let provider: MoyaProvider<HomeAPITarget>
    
    init(provider: MoyaProvider<HomeAPITarget> = APIManager.shared.testProvider(for: HomeAPITarget.self)) {
        self.provider = provider
    }
    
    public func getWordList() {
        provider.request(.getHomeData) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleResponse(response: response)
            case .failure(let error):
                print("단어 받아오기 에러: \(error)")
            }
        }
    }
    
    public func handleResponse(response: Response) {
        do {
            let decodedData = try JSONDecoder().decode(HomeResponseData.self, from: response.data)
            homeResponseData = decodedData
        } catch {
            homeResponseData = nil
            print("단어 해독 실패 : \(error)")
        }
    }
    
    public func getSentence() {
        provider.request(.getHomeData) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleResponse(response: response)
            case .failure(let error):
                print("단어 받아오기 에러: \(error)")
            }
        }
    }
    
    public func Sentence(response: Response) {
        do {
            let decodedData = try JSONDecoder().decode(HomeResponseData.self, from: response.data)
            homeResponseData = decodedData
        } catch {
            homeResponseData = nil
            print("단어 해독 실패 : \(error)")
        }
    }
    
    
    
    
}
