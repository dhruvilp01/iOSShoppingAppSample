//
//  CategoryCell.swift
//  shoppingAndLogin
//
//  Created by Dhruvil Patel on 6/18/18.
//  Copyright © 2018 Dhruvil. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func updateViews (category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }

}
