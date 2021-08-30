//
//  APIResult.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation
enum APIResult<T> {
    case success(T)
    case failure(String)
}
