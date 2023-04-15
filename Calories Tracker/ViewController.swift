//
//  ViewController.swift
//  Calories Tracker
//
//  Created by Ankan Saha on 25/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var food: UITextField!
    @IBOutlet var carbs: UITextField!
    
    @IBOutlet var protion: UITextField!
    @IBOutlet var fat: UITextField!
    @IBOutlet var time: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func add(_ sender: UIButton) {
        let modelInfo = meal_model(food_name: food.text!, amtCarbs: carbs.text!, amtPortin: protion.text!, amtFat: fat.text!, time: time.text!)
        let isSave = DatabaseManager.getInstance().saveMeal(modelInfo)
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
