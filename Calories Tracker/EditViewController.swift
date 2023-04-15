//
//  EditViewController.swift
//  Calories Tracker
//
//  Created by Ankan Saha on 26/12/22.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var foodname: UITextField!
    
    @IBOutlet weak var amtCarbs: UITextField!
    @IBOutlet weak var amtProtin: UITextField!
    @IBOutlet weak var amtFat: UITextField!
    @IBOutlet weak var time: UITextField!
    
    var foodnameCame = ""
    var amtCarbsCame = ""
    var amtProtinCame = ""
    var amtFatCame = ""
    var timeCame = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodname.text = foodnameCame
        amtCarbs.text = amtCarbsCame
        amtProtin.text = amtProtinCame
        amtFat.text = amtFatCame
        time.text = timeCame

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func confirm(_ sender: UIButton) {
        var flag = DatabaseManager.getInstance().editData(old_food_name: foodnameCame, food_name: foodname.text!, amt_carbs: amtCarbs.text!, amt_Protin: amtProtin.text!, amt_Fat: amtFat.text!, time: time.text!)
        print(flag)
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
