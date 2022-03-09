//
//  Category.swift
//  FinalProject
//
//  Created by TheFinale on 7/17/21.
//  Group: Alt Wav
import Foundation
import UIKit

class Category{
    var category_image: UIImage
    var category_title: String
    var category_id: Int
    
    init(category_image: UIImage, category_title: String, category_id: Int){
        self.category_image = category_image
        self.category_title = category_title
        self.category_id = category_id
    }
}
