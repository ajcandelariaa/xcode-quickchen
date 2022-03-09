//
//  Models.swift
//  FinalProject
//
//  Created by TheFinale on 7/17/21.
//  Group: Alt Wav
import Foundation

struct Result: Codable{
    let recipe_data: [CategoryInfo]
    let user: [UserInfo]
}
struct CategoryInfo: Codable{
    let category_id: Int
    let category_image: String
    let category_name: String
    let category_recipe: [CategoryRecipeInfo]
}
struct CategoryRecipeInfo: Codable{
    let recipe_id: Int
    let recipe_image: String
    let recipe_name: String
    let recipe_description: String
    let recipe_prep_time: String
    let recipe_cook_time: String
    let recipe_total_time: String
    let recipe_serving: String
    let recipe_ingredient: [String]
    let recipe_step: [String]
}
struct UserInfo: Codable {
    let user_id: Int
    let user_fullname: String
    let user_image: String
    let user_username: String
    let user_password: String
}
