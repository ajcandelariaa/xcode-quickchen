//
//  CategoryCell.swift
//  FinalProject
//
//  Created by TheFinale on 7/17/21.
//  Group: Alt Wav
import UIKit

class CategoryCell: UITableViewCell {

    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryView: UIView!
    
    func setCategory(category: Category) {
        categoryLabel.text = category.category_title
        categoryImageView.image = category.category_image
        
        categoryImageView.layer.masksToBounds = true
        categoryImageView.layer.borderWidth = 0.5
        categoryImageView.layer.borderColor = UIColor.white.cgColor
        categoryImageView.layer.cornerRadius = categoryImageView.bounds.width / 25
        
        categoryView.layer.masksToBounds = true
        categoryView.layer.borderWidth = 0.5
        categoryView.layer.borderColor = UIColor.white.cgColor
        categoryView.layer.cornerRadius = categoryView.bounds.width / 25
    }

}
