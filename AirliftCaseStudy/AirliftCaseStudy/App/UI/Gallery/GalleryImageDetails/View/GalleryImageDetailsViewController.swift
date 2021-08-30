//
//  GalleryImageDetailsViewController.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import UIKit
import SDWebImage

class GalleryImageDetailsViewController: UIViewController {
    
    // MARK: - OUTLETS
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var labelLikes: UILabel!
    @IBOutlet weak var labelViews: UILabel!
    
    
    // MARK: - VARIABLES
    var viewModel: GalleryImageDetailViewModel!
    
    // MARK: - VIEW LIFE CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    // MARK: - SETUP VIEW
    
    private func bindViewModel() {
        viewImage.sd_setImage(with: URL.init(string: viewModel.imageURL ?? ""), placeholderImage: #imageLiteral(resourceName: "square-placeholder"))
        title = "Gallery"
        labelLikes.text = viewModel.likes
        labelViews.text = viewModel.views
    }
    
}
