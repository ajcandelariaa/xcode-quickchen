//
//  RecipeCell.swift
//  FinalProject
//
//  Created by TheFinale on 7/17/21.
//  Group: Alt Wav
import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    
    @IBOutlet weak var recipePrepTime: UILabel!
    @IBOutlet weak var recipeCookTime: UILabel!
    @IBOutlet weak var recipeServing: UILabel!
    //    @IBOutlet weak var recipeDescription: UITextView!
    
//    @IBOutlet weak var btnLike: UIButton!
    func setRecipe(recipe: Recipe) {
        recipeImage.image = recipe.recipe_image
        recipeTitle.text = recipe.recipe_name
//        recipeDescription.text = recipe.recipe_description
        recipePrepTime.text = "Prep: \(recipe.recipe_prep_time)"
        recipeCookTime.text = "Cook: \(recipe.recipe_cook_time)"
        recipeServing.text = "Serving: \(recipe.recipe_serving)"
        
        recipeImage.layer.masksToBounds = true
        recipeImage.layer.borderWidth = 0.5
        recipeImage.layer.borderColor = UIColor.white.cgColor
        recipeImage.layer.cornerRadius = recipeImage.bounds.width / 25
    }
//    @IBAction func btnClick(_ sender: UIButton) {
//        if(btnLike.tag == 0){
//            btnLike.setImage(UIImage(named: "crispy-pata"), for: .normal)
//            btnLike.tag = 1
//        } else {
//            btnLike.setImage(UIImage(named: "pandesal"), for: .normal)
//            btnLike.tag = 0
//        }
    
    
//    }
}
