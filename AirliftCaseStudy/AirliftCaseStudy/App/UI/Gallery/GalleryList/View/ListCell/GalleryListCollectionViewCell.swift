//
//  GalleryListCollectionViewCell.swift
//  AirliftCaseStudy
//
//  Created by IMac on 30/08/2021.
//

import UIKit
import SDWebImage

class GalleryListCollectionViewCell: UICollectionViewCell {

    // MARK: - OUTLETS
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var viewImage: UIImageView!
    
    // MARK: - VARIABLES
    
    // MARK: - VIEW LIFE CYCLE
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - CONFIGURE CELL
    
    func configureCell(object: GalleryCellViewModel) {
        self.viewImage.sd_setImage(with: URL.init(string: object.previewImageUrl),
                                   placeholderImage: UIImage.init(named: "square-placeholder"),
                                   options: [.highPriority],
                                   context: nil)
    }
}
