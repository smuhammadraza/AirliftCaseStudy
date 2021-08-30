//
//  GalleryDIContainer.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import UIKit

final class GalleryDIContainer {
    lazy var repository: GalleryRepositoryProtocol = GalleryDataStore()
}

extension GalleryDIContainer: GalleryListCoordinatorDependencies {
    // MARK:- RecipeList
    func makeGalleryFlowCoodinator(navigation: AppNavigation) -> GalleryListCoordinator {
        GalleryListCoordinator(dependencies: self, navigation: navigation)
    }

    func makeGalleryUseCase() -> GalleryUseCaseProtocol { GalleryUseCase(repository: repository) }

    func makeGalleryListViewModel(actions: GalleryListViewModelAction) -> GalleryListViewModel {
        GalleryListViewModel(actions: actions, useCase: makeGalleryUseCase())
    }

    func makeGalleryListViewController(actions: GalleryListViewModelAction) -> GalleryListViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let recipeListVC: GalleryListViewController = storyboard.initialViewController()
        recipeListVC.viewModel = makeGalleryListViewModel(actions: actions)
        return recipeListVC
    }

    // MARK:- Recipe Details

//    func makeRecipeDetailViewModel(recipe: Gallery) -> GalleryDetailViewModel {
//        RecipeDetailViewModel(recipe: recipe)
//    }

//    func makeRecipeDetailViewController(recipe: Gallery) -> GalleryDetailViewController {
//        let storyboard = UIStoryboard(storyboard: .main)
//        let detailVC: GalleryDetailViewController = storyboard.instantiateViewController()
//        detailVC.viewModel = makeRecipeDetailViewModel(recipe: recipe)
//        return detailVC
//    }
}
