//
//  GalleryDataModel.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation

// MARK: - GalleryDataModel
struct GalleryDataModel: Codable {
    let total, totalHits: Int
    let hits: [GalleryHit]
    
    var data: [Gallery] {
        var galleryData = [Gallery]()
        self.hits.forEach { hit in
            galleryData.append(Gallery(previewURL: hit.previewURL,
                                       largeImageURL: hit.largeImageURL,
                                       likes: hit.likes,
                                       views: hit.views))
        }
        return galleryData
    }
}

// MARK: - Hit
struct GalleryHit: Codable {
    let id: Int
    let pageURL: String
    let type: String
    let tags: String
    let previewURL: String
    let previewWidth, previewHeight: Int
    let webformatURL: String
    let webformatWidth, webformatHeight: Int
    let largeImageURL: String
    let imageWidth, imageHeight, imageSize, views: Int
    let downloads, collections, likes, comments: Int
    let userID: Int
    let user: String
    let userImageURL: String

    enum CodingKeys: String, CodingKey {
        case id, pageURL, type, tags, previewURL, previewWidth, previewHeight, webformatURL, webformatWidth, webformatHeight, largeImageURL, imageWidth, imageHeight, imageSize, views, downloads, collections, likes, comments
        case userID = "user_id"
        case user, userImageURL
    }
}
