//
//  GalleryListCoordinator.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import UIKit

protocol GalleryListCoordinatorDependencies {
    func makeGalleryListViewController(actions: GalleryListViewModelAction) -> GalleryListViewController
//    func makeRecipeDetailViewController(recipe: Gallery) -> GalleryDetailViewController
}

final class GalleryListCoordinator: BaseCoordinator {
    
    let dependencies: GalleryListCoordinatorDependencies
    private weak var navigation: UINavigationController?
    
    private weak var recipeListVC: GalleryListViewController?
    
    init(dependencies: GalleryListCoordinatorDependencies, navigation: AppNavigation) {
        self.dependencies = dependencies
        self.navigation = navigation
    }
    
    func start() {
        let actions = GalleryListViewModelAction(showDetails: showDetailsViewController)
        let vc = dependencies.makeGalleryListViewController(actions: actions)
        navigation?.pushViewController(vc, animated: true)
        recipeListVC = vc
    }
    
    private func showDetailsViewController(recipe: Gallery) {
//        let detailVC = dependencies.makeRecipeDetailViewController(recipe: recipe)
//        navigation?.pushViewController(detailVC, animated: true)
    }
}
