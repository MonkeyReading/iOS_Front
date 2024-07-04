//
//  QuestionViewModel.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation
import Moya

class QuestionViewModel: ObservableObject {
    @Published var bookQuestionResponseData: BookQuestionResponseData?
    
    var provider: MoyaProvider<QuestionAPITarget>
    
    init(provider: MoyaProvider<QuestionAPITarget> = APIManager.shared.testProvider(for: QuestionAPITarget.self)) {
        self.provider = provider
    }
    
    public func getQuestion() {
        provider.request(.getQuestion) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handler(response: response)
            case .failure(let error):
                print("error")
            }
        }
    }
    
    private func handler(response: Response) {
        do {
            let decodedData = try JSONDecoder().decode(BookQuestionResponseData.self, from: response.data)
            bookQuestionResponseData = decodedData
        } catch {
            print(error)
        }
    }
}
