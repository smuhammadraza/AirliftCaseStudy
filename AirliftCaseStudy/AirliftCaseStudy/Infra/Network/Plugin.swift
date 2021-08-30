//
//  Plugin.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation
import Moya

struct Plugin {
    
    private init() {}
    
    static let networkPlugin = NetworkActivityPlugin(networkActivityClosure: { (changeType, _) in
        switch changeType {
        case .began:
            print("🌍 -->> Network Call Started... Data & Time -->> \(Date()) <<--")
            LoadingView.show()
        case .ended:
            LoadingView.hide()
            print("🌍 -->> Network Call Ended... Data & Time -->> \(Date()) <<--")
        }
    })
    
    static let loggerPlugin = NetworkLoggerPlugin()
    
}
