//
//  AppCoordinator.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation

final class AppCoordinator: BaseCoordinator {
    
    let navigation: AppNavigation
    let appDIContainer: AppDIContainer
    
    init(navigation: AppNavigation, appDIContainer: AppDIContainer) {
        self.navigation = navigation
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let galleryListDIContainer = appDIContainer.makeGalleryDIContainer()
        let galleryListFlowCoordinator = galleryListDIContainer.makeGalleryFlowCoodinator(navigation: navigation)
        galleryListFlowCoordinator.start()
    }
}
