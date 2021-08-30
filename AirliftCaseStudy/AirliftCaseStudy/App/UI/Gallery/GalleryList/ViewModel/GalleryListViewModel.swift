//
//  GalleryListViewModel.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import Foundation

struct GalleryListViewModelAction {
    var showDetails: ((Gallery) -> ())?
}

protocol GalleryListViewModelInput {
    func viewDidLoad()
    func didSearch(query: String)
    func didCancelSearch()
    func didTapOnRow(at index: Int)
    func celViewModel(at index: Int) -> GalleryCellViewModel
    func didScrollToEnd()
}

protocol GalleryListViewModelOutput {
    var totalRows: Int { get }
    var heightForRow: Int { get }
    var title: String { get }
    var isNoDataHidden: Observable<Bool> { get }
    var loader: Observable<Bool> { get }
    var reload: Observable<Void> { get }
    var error: Observable<String> { get }
}

protocol GalleryListViewModelProtocol: GalleryListViewModelInput, GalleryListViewModelOutput { }

final class GalleryListViewModel: GalleryListViewModelProtocol {
    
    var isNoDataHidden: Observable<Bool> = Observable(true)
    var loader: Observable<Bool> = Observable(false)
    var reload: Observable<Void> = Observable(())
    var error: Observable<String> = Observable("")
    
    var totalRows: Int { gallery.count }
    var heightForRow: Int { 100 }
    var title: String { "Gallery" }
    
    private var gallery = [Gallery]() {
        didSet {
            reload.value = ()
            isNoDataHidden.value = !gallery.isEmpty
        }
    }
    
    private let actions: GalleryListViewModelAction
    private let useCase: GalleryUseCaseProtocol
    
    private var query: String = ""
    private var pageNumber: Int = 1
    private var totalHits: Int = 0
    
    init(actions: GalleryListViewModelAction, useCase: GalleryUseCaseProtocol) {
        self.actions = actions
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        
    }
    
    func didSearch(query: String) {
        loader.value = true
        self.pageNumber = 1
        self.query = query
        useCase.fetchGallery(searchKeyword: query,
                             pageNumber: pageNumber,
                             onSuccess: onSuccess,
                             onFailure: onFailure)
    }
    
    func didCancelSearch() {
        loader.value = false
    }
    
    func didTapOnRow(at index: Int) {
        actions.showDetails?(gallery[index])
    }
    
    func didScrollToEnd() {
        if self.shouldTryNextPage() {
            pageNumber += 1
            loader.value = true
            useCase.fetchGallery(searchKeyword: query,
                                 pageNumber: pageNumber,
                                 onSuccess: onSuccessPagination,
                                 onFailure: onFailure)
        }
    }
    
    func celViewModel(at index: Int) -> GalleryCellViewModel {
        let previewURLStirng = gallery[index].previewURL ?? ""
        let largeImageURLString = gallery[index].largeImageURL ?? ""
        let likes = gallery[index].likes ?? 0
        let views = gallery[index].views ?? 0
        return GalleryCellViewModel(previewImageUrl: previewURLStirng,
                                    largeImageUrl: largeImageURLString,
                                    likes: likes,
                                    views: views)
    }
    
    private func onSuccessPagination(data: ([Gallery], Int)) {
        loader.value = false
        gallery += data.0
        totalHits = data.1
    }
    
    private func onSuccess(data: ([Gallery], Int)) {
        loader.value = false
        gallery = data.0
        totalHits = data.1
    }
    
    private func onFailure(errorMessage: String) {
        loader.value = false
        error.value = errorMessage
    }
    
    private func shouldTryNextPage() -> Bool {
        return ((totalHits/50) > pageNumber+1)
    }
}
