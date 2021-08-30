//
//  GalleryImageDetailsViewModel.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation

protocol GalleryImageDetailViewOutput {
    var imageURL: String? { get }
    var likes: String { get }
    var views: String { get }
}

protocol GalleryImageDetailViewModelProtocol: GalleryImageDetailViewOutput { }

struct GalleryImageDetailViewModel: GalleryImageDetailViewModelProtocol {
   
    var imageURL: String? { gallery.largeImageURL }
    var likes: String { "\(gallery.likes ?? 0)" }
    var views: String { "\(gallery.views ?? 0)" }
    
    private let gallery: Gallery
    
    init(gallery: Gallery) { self.gallery = gallery }
}
