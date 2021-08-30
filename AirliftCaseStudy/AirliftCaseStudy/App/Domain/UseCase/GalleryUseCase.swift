//
//  GalleryUseCase.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation

protocol GalleryUseCaseProtocol {
    func fetchGallery(searchKeyword: String,
                      pageNumber: Int,
                      onSuccess: @escaping(([Gallery], Int)) -> (),
                      onFailure: @escaping(String) -> () )
}

final class GalleryUseCase: GalleryUseCaseProtocol {
    
    let repository: GalleryRepositoryProtocol
    
    init(repository: GalleryRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchGallery(searchKeyword: String,
                      pageNumber: Int,
                      onSuccess: @escaping (([Gallery], Int)) -> (),
                      onFailure: @escaping (String) -> ()) {
        repository.fetchGallery(searchKeyword: searchKeyword, pageNumber: pageNumber) { result in
            switch result {
            case .success(let resp):
                onSuccess((resp.data, resp.totalHits))
            case .failure(_):
                onFailure(Constants.errorMessage)
            }
        }
    }
    
}
