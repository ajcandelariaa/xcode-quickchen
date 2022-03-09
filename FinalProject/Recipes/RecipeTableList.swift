//
//  RecipeTableList.swift
//  FinalProject
//
//  Created by TheFinale on 7/17/21.
//  Group: Alt Wav
import UIKit
class RecipeTableList: UIViewController{
    var recipes: [Recipe] = []
    var result: Result?
    var sendItem: Category?
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        if let category_name = sendItem?.category_title{
            categoryLabel.text = "\(category_name) Recipes"
        }
        
        parseJson()
        recipes = createArray()
        
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
    }
    
    private func parseJson(){
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func createArray() -> [Recipe] {
        var arrayRecipe: [Recipe] = []
        let countCategory = result?.recipe_data.count
        for index in 0..<countCategory!{
            if let tempCategory = result?.recipe_data[index]{
                if let category_id = sendItem?.category_id {
                    if tempCategory.category_id == category_id {
                        let getRecipe = tempCategory.category_recipe
                        let countGetRecipe = getRecipe.count
                        for index2 in 0..<countGetRecipe{
                            let recipe = Recipe(
                                recipe_id: getRecipe[index2].recipe_id,
                                recipe_image: UIImage(named: getRecipe[index2].recipe_image)!,
                                recipe_name: getRecipe[index2].recipe_name,
                                recipe_description: getRecipe[index2].recipe_description,
                                recipe_prep_time: getRecipe[index2].recipe_prep_time,
                                recipe_cook_time: getRecipe[index2].recipe_cook_time,
                                recipe_total_time: getRecipe[index2].recipe_total_time,
                                recipe_serving: getRecipe[index2].recipe_serving,
                                recipe_ingredient: getRecipe[index2].recipe_ingredient,
                                recipe_step: getRecipe[index2].recipe_step,
                                category_id: category_id,
                                category_name: tempCategory.category_name
                            )
                            arrayRecipe.append(recipe)
                        }
                    }
                }
            }
        }
        return arrayRecipe
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as! RecipeView
        if let indexPath = self.recipeTableView.indexPathForSelectedRow {
            let item = recipes[indexPath.row]
            vc.sendRecipeInfo = item
        }
    }
}
extension RecipeTableList: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as! RecipeCell

        cell.setRecipe(recipe: recipe)
        return cell
    }
}
