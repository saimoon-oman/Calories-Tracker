//
//  BasicApiController.swift
//  Calories Tracker
//
//  Created by Ankan Saha on 26/12/22.
//

import UIKit
import Foundation

class BasicApiController: UIViewController {
    
    
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var carbs: UILabel!
    @IBOutlet weak var protin: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var foodType: UILabel!
    
    
    public var foodNameNew: String = ""
    public var caloriesNew: String = ""
    public var carbsNew: String = ""
    public var protinNew: String = ""
    public var fatNew: String = ""
    public var foodTypeNew: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var randomValue = arc4random()%5
        var links:[String] = ["https://mocki.io/v1/6ce4a07c-954e-441b-8a3d-5c830f6124f5",
                              "https://mocki.io/v1/800e4459-c850-41ea-be57-4ade9a0211b9",
                              "https://mocki.io/v1/9d4b76ad-bcf6-4437-9237-9e32aece6ec9",
                              "https://mocki.io/v1/da460475-e623-4d48-9a6c-0f20ef88f1e0",
                              "https://mocki.io/v1/af52952e-eaeb-42d2-b119-b00ef58a3edb"]
        
        print("getting data for \(randomValue)")
        getData(from: links[Int(randomValue)])
        
        print("after getdata function")
        print(foodNameNew)
        
        // Do any additional setup after loading the view.
    
    
    let task = URLSession.shared.dataTask(with: URL(string: links[Int(randomValue)])!, completionHandler: {data, response, error in
        
        guard let data = data, error == nil else {
            print("something went wrong")
            return
        }
        
        var result: Response?
        do {
            result = try JSONDecoder().decode(Response.self, from: data)
            
        }
        catch {
            print("failed to convert \(error.localizedDescription)")
        }
        
        guard let json = result else {
            return
        }
        
        print("Data:")
        print(json.foodName)
        print(json.calories)
        
        
        self.foodName.text = json.foodName
        self.calories.text = json.calories
        self.carbs.text = json.carbsCal
        self.protin.text = json.protinCal
        self.fat.text = json.fatCal
        self.foodType.text = json.foodType
        
        
        print(self.foodNameNew, json.foodName)
        
    })
    
    task.resume()
    
}

private func getData(from url: String) {
    
    let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
        
        guard let data = data, error == nil else {
            print("something went wrong")
            return
        }
        
        var result: Response?
        do {
            result = try JSONDecoder().decode(Response.self, from: data)
            
        }
        catch {
            print("failed to convert \(error.localizedDescription)")
        }
        
        guard let json = result else {
            return
        }
        
        print("Data:")
        print(json.foodName)
        print(json.calories)
        
        
        self.foodNameNew = json.foodName
        self.caloriesNew = json.calories
        self.carbsNew = json.carbsCal
        self.protinNew = json.protinCal
        self.fatNew = json.fatCal
        self.foodTypeNew = json.foodType
        
        print(self.foodNameNew, json.foodName)
        
    })
        
    task.resume()
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct Response: Codable {
    
    var foodName: String
    var calories: String
    var carbsCal: String
    var protinCal: String
    var fatCal: String
    var foodType: String
    
}
