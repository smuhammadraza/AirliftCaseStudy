//
//  GalleryListCoordinator.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import UIKit

protocol GalleryListCoordinatorDependencies {
    func makeGalleryListViewController(actions: GalleryListViewModelAction) -> GalleryListViewController
    func makeGalleryImageDetailViewController(gallery: Gallery) -> GalleryImageDetailsViewController
}

final class GalleryListCoordinator: BaseCoordinator {
    
    let dependencies: GalleryListCoordinatorDependencies
    private weak var navigation: UINavigationController?
    
    private weak var galleryListVC: GalleryListViewController?
    
    init(dependencies: GalleryListCoordinatorDependencies, navigation: AppNavigation) {
        self.dependencies = dependencies
        self.navigation = navigation
    }
    
    func start() {
        let actions = GalleryListViewModelAction(showDetails: showDetailsViewController)
        let vc = dependencies.makeGalleryListViewController(actions: actions)
        navigation?.pushViewController(vc, animated: true)
        galleryListVC = vc
    }
    
    private func showDetailsViewController(gallery: Gallery) {
        let detailVC = dependencies.makeGalleryImageDetailViewController(gallery: gallery)
        navigation?.pushViewController(detailVC, animated: true)
    }
}
