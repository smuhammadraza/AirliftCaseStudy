//
//  Constants.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation

struct Constants {
    
    static let errorMessage = "Something went wrong. Please try later"
   
    struct ApiConfig {
        static let apiKey = "23153772-7b69c4830cfea4b6adeaebea4"
        static let BaseURL = "https://pixabay.com/api/?key=\(ApiConfig.apiKey)"
    }
}
