//
//  Recipe.swift
//  FinalProject
//
//  Created by TheFinale on 7/17/21.
//  Group: Alt Wav
import Foundation
import UIKit

class Recipe{
    var recipe_id: Int
    var recipe_image: UIImage
    var recipe_name: String
    var recipe_description: String
    var recipe_prep_time: String
    var recipe_cook_time: String
    var recipe_total_time: String
    var recipe_serving: String
    var recipe_ingredient: [String]
    var recipe_step: [String]
    var category_id: Int
    var category_name: String
    
    init(
        recipe_id: Int,
        recipe_image: UIImage,
        recipe_name: String,
        recipe_description: String,
        recipe_prep_time: String,
        recipe_cook_time: String,
        recipe_total_time: String,
        recipe_serving: String,
        recipe_ingredient: [String],
        recipe_step: [String],
        category_id: Int,
        category_name: String
        )
    {
        self.recipe_id = recipe_id
        self.recipe_image = recipe_image
        self.recipe_name = recipe_name
        self.recipe_description = recipe_description
        self.recipe_prep_time = recipe_prep_time
        self.recipe_cook_time = recipe_cook_time
        self.recipe_total_time = recipe_total_time
        self.recipe_serving = recipe_serving
        self.recipe_ingredient = recipe_ingredient
        self.recipe_step = recipe_step
        self.category_id = category_id
        self.category_name = category_name
    }
}
