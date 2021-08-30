//
//  NetworkManager.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation
import Moya

class NetworkManager {
    
    // MARK: - LOGIN
    class func getSearchImages(keyword: String,
                               pageNumber: Int,
                               completion: @escaping (APIResult<GalleryDataModel>) -> Void) {
        Provider.services.request(.searchImages(keyword: keyword, pageNumber: pageNumber)) { (result) in
            do {
                let response: GalleryDataModel = try result.decoded()
                completion(.success(response))
            } catch (let error) {
                completion(.failure(error.localizedDescription))
            }
        }
    }
    
}
