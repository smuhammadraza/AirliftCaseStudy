//
//  Services.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation
import Moya

enum Services {
    case searchImages(keyword:String, pageNumber: Int)
}

extension Services: TargetType {
    
    var baseURL: URL {
        return URL.init(string: Constants.ApiConfig.BaseURL)!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .searchImages(keyword, pageNumber):
            return .requestParameters(parameters: ["q": keyword,
                                                   "image_type": "photo",
                                                   "per_page": 50,
                                                   "page": pageNumber],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return [ "Content-Type": "application/json" ]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
}
