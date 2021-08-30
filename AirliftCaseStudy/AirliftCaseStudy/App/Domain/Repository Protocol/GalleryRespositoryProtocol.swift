//
//  GalleryRespositoryProtocol.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation

protocol GalleryRepositoryProtocol {
    func fetchGallery(searchKeyword: String,
                      pageNumber: Int,
                      onCompletion: @escaping (APIResult<GalleryDataModel>) -> ())
}
