//
//  BookSetViewModel.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//

import Foundation
import Moya

class BookSetViewModel: ObservableObject {
    
    @Published var bookSetData: BookSetData?
    
    var provider: MoyaProvider<BookAPITarget>
    
    init(
        provider: MoyaProvider<BookAPITarget> = APIManager.shared.testProvider(for: BookAPITarget.self)
    ) {
        self.provider = provider
    }
    
    public func getBookList() {
        provider.request(.getBookList) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleBookList(response: response)
            case .failure(let error):
                print("책 리스트 에러: \(error)")
            }
        }
    }
    
    private func handleBookList(response: Response) {
        do {
            let decodedData = try JSONDecoder().decode(BookSetData.self, from: response.data)
            bookSetData = decodedData
        } catch {
            print("북 리스트 해독 오류 : \(error)")
        }
    }
}
