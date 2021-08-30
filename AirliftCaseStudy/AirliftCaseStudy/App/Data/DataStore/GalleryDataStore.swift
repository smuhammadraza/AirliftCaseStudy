//
//  GalleryDataStore.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation

final class GalleryDataStore: GalleryRepositoryProtocol {
    
    func fetchGallery(searchKeyword: String,
                      pageNumber: Int,
                      onCompletion: @escaping (APIResult<GalleryDataModel>) -> ()) {
        NetworkManager.getSearchImages(keyword: searchKeyword, pageNumber: pageNumber) { result in
            onCompletion(result)
        }
    }

}
