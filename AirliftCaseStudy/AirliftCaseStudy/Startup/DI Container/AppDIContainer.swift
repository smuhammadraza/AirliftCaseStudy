//
//  AppDIContainer.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation

final class AppDIContainer {
    
    func makeGalleryDIContainer() -> GalleryDIContainer {
        return GalleryDIContainer()
    }
}
