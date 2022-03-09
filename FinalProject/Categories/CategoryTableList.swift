//
//  CategoryTableList.swift
//  FinalProject
//
//  Created by TheFinale on 7/17/21.
//  Group: Alt Wav
import UIKit

class CategoryTableList: UIViewController {
    
    var categories: [Category] = []
    var result: Result?
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "Quickchen-Logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        parseJson()
        categories = createArray()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.animate()
        })
    }
    private func animate(){
        UIView.animate(withDuration: 0.5, animations: {
            let size = self.view.frame.size.width * 5
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            self.imageView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
            self.imageView.alpha = 0
        })
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

    
    func createArray() -> [Category] {
        var arrayCategory: [Category] = []
        let countCategories = result?.recipe_data.count
        for index in 0..<countCategories!{
            if let tempCategory = result?.recipe_data[index]{
                let category = Category(category_image: UIImage(named: tempCategory.category_image)!, category_title: tempCategory.category_name, category_id: tempCategory.category_id)
                arrayCategory.append(category)
            }
        }
        return arrayCategory
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as! RecipeTableList
        if let indexPath = self.categoryTableView.indexPathForSelectedRow {
            let item = categories[indexPath.row]
            vc.sendItem = item
        }
    }
}

extension CategoryTableList: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell

        cell.setCategory(category: category)

        return cell
    }
}
