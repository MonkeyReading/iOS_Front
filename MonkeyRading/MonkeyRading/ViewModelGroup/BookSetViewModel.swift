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
        provider: MoyaProvider<BookAPITarget> = APIManager.shared.createProvider(for: BookAPITarget.self)
    ) {
        self.provider = provider
    }
}
