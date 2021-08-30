//
//  GalleryListViewController.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import UIKit

class GalleryListViewController: UIViewController, AlertsPresentable {

    // MARK: - OUTLETS
    @IBOutlet weak var viewSearchContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - VARIABLES
    var viewModel: GalleryListViewModel!
    private var searchBar = UISearchBar()
    
    // MARK: - VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - SETUP VIEW
    
    private func setupView() {
        setupSearchController()
        setupCollectionView()
        bindViewModel()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "GalleryListCollectionViewCell", bundle: .main),
                                forCellWithReuseIdentifier: "GalleryListCollectionViewCell")
        collectionView.keyboardDismissMode = .onDrag
    }
    
    private func bindViewModel() {
        title = viewModel.title
        viewModel.error.observe(on: self) { [weak self] in self?.showAlert(with: "Error", and: $0) }
        viewModel.reload.observe(on: self) { [weak self] _ in self?.collectionView.reloadData() }
        viewModel.loader.observe(on: self) { ($0) ? LoadingView.show() : LoadingView.hide() }
    }
}


// MARK: - EXTENSION FOR SETUP SEARCH CONTROLLER

extension GalleryListViewController {
    private func setupSearchController() {
        searchBar.delegate = self
//        searchBar.placeholder = viewModel.searchBarPlaceholder
        searchBar.translatesAutoresizingMaskIntoConstraints = true
        searchBar.barStyle = .black
        searchBar.frame = viewSearchContainer.bounds
        searchBar.autoresizingMask = [.flexibleWidth]
        viewSearchContainer.addSubview(searchBar)
        definesPresentationContext = true
    }
}


// MARK: - EXTENSION FOR SEARCHBAR DELEGATE

extension GalleryListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        self.view.endEditing(true)
        viewModel.didSearch(query: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.didCancelSearch()
    }
}

// MARK: - EXTENSION FOR COLLECTION VIEW DATA SOURCE

extension GalleryListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == viewModel.totalRows - 1 {
            viewModel.didScrollToEnd()
        }
    }
}

// MARK: - EXTENSION FOR COLLECTION VIEW DELEGATE

extension GalleryListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.totalRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryListCollectionViewCell", for: indexPath) as? GalleryListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(object: viewModel.celViewModel(at: indexPath.item))
        return cell
    }
}

// MARK: - EXTENSION FOR COLLECTION VIEW FLOW LAYOUT DELEGATE

extension GalleryListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width/2, height: 100.0)
    }
}
