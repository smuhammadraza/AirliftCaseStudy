//
//  Extension+Result.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation
import Moya

extension Result {
    func resolve() throws -> Success {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}

extension Result where Success == Moya.Response {
    func decoded<T: Decodable>(keypath: String? = nil) throws -> T {
        let decoder = JSONDecoder()
        let response = try resolve()
        return try response.map(T.self, atKeyPath: keypath, using: decoder, failsOnEmptyData: true)//decoder.decode(T.self, from: response.data)
    }
}
