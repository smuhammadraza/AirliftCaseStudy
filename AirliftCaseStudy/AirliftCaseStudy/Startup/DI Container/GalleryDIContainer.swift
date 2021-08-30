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
    // MARK:- GalleryList
    func makeGalleryFlowCoodinator(navigation: AppNavigation) -> GalleryListCoordinator {
        GalleryListCoordinator(dependencies: self, navigation: navigation)
    }

    func makeGalleryUseCase() -> GalleryUseCaseProtocol { GalleryUseCase(repository: repository) }

    func makeGalleryListViewModel(actions: GalleryListViewModelAction) -> GalleryListViewModel {
        GalleryListViewModel(actions: actions, useCase: makeGalleryUseCase())
    }

    func makeGalleryListViewController(actions: GalleryListViewModelAction) -> GalleryListViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let galleryListVC: GalleryListViewController = storyboard.initialViewController()
        galleryListVC.viewModel = makeGalleryListViewModel(actions: actions)
        return galleryListVC
    }

    // MARK:- Gallery Details

    func makeGalleryDetailViewModel(gallery: Gallery) -> GalleryImageDetailViewModel {
        GalleryImageDetailViewModel(gallery: gallery)
    }

    func makeGalleryImageDetailViewController(gallery: Gallery) -> GalleryImageDetailsViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let detailVC: GalleryImageDetailsViewController = storyboard.instantiateViewController()
        detailVC.viewModel = makeGalleryDetailViewModel(gallery: gallery)
        return detailVC
    }
}
