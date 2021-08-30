//
//  Provider.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation
import Moya

struct Provider {
    
    
    static let services = MoyaProvider<Services>(plugins: [Plugin.networkPlugin, Plugin.loggerPlugin])
    static let backgroundServices = MoyaProvider<Services>(plugins: [Plugin.loggerPlugin])
    
    static func getMoyaProvider(shouldShowActivityIndicator: Bool = true) -> MoyaProvider<Services> {
        return shouldShowActivityIndicator ? Provider.services : Provider.backgroundServices
    }
}
