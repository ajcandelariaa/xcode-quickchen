//
//  RecipeView.swift
//  FinalProject
//
//  Created by TheFinale on 7/17/21.
//  Group: Alt Wav
import Foundation
import UIKit
class RecipeView: UIViewController, UITextViewDelegate{
    var sendRecipeInfo: Recipe?
    var ingredients: [String] = []
    var steps: [String] = []
    var finalIngredientsText: String = ""
    var finalStepsText: String = ""
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeLabelName: UILabel!
    @IBOutlet weak var recipeLabelCategory: UILabel!
    @IBOutlet weak var recipeLabelPrepTime: UILabel!
    @IBOutlet weak var recipeLabelCookTime: UILabel!
    @IBOutlet weak var recipeLabelTotalTime: UILabel!
    @IBOutlet weak var recipeLabelServing: UILabel!
    @IBOutlet weak var recipeTextViewDescription: UITextView!
    @IBOutlet weak var recipeTextViewIngredients: UITextView!
    @IBOutlet weak var recipeTextViewSteps: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        
        recipeImage.layer.masksToBounds = true
        recipeImage.layer.borderWidth = 0.5
        recipeImage.layer.borderColor = UIColor.white.cgColor
        recipeImage.layer.cornerRadius = recipeImage.bounds.width / 25
        
        
        
        if let recipeInfo = sendRecipeInfo{
            recipeImage.image = recipeInfo.recipe_image
            recipeLabelName.text = recipeInfo.recipe_name
            recipeLabelCategory.text = recipeInfo.category_name
            recipeLabelPrepTime.text = recipeInfo.recipe_prep_time
            recipeLabelCookTime.text = recipeInfo.recipe_cook_time
            recipeLabelTotalTime.text = recipeInfo.recipe_total_time
            recipeLabelServing.text = recipeInfo.recipe_serving
            recipeTextViewDescription.text = recipeInfo.recipe_description
            ingredients = recipeInfo.recipe_ingredient
            steps = recipeInfo.recipe_step
            
            var count1 = 1
            for item1 in ingredients{
                finalIngredientsText = finalIngredientsText + "\u{2022} \(item1) \n"
                count1 += 1
            }
            recipeTextViewIngredients.text = finalIngredientsText
            
            var count2 = 1
            for item2 in steps{
                finalStepsText = finalStepsText + "\(count2). \(item2) \n\n"
                count2 += 1
            }
            recipeTextViewSteps.text = finalStepsText
        }
        
    }
}
