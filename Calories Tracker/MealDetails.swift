//
//  MealDetails.swift
//  Calories Tracker
//
//  Created by Ankan Saha on 25/12/22.
//

import UIKit

class MealDetails: UIViewController {
    
    
//    @IBOutlet var foodName: UILabel!
//    @IBOutlet var protin: UILabel!
//    @IBOutlet var fat: UILabel!
//    @IBOutlet var time: UILabel!
//    @IBOutlet var kcal: UILabel!
//    @IBOutlet var carbs: UILabel!
    
    
    @IBOutlet var foodName: UILabel!
    
    @IBOutlet var carbs: UILabel!
    
    @IBOutlet var protin: UILabel!
    @IBOutlet var fat: UILabel!
    
    @IBOutlet var time: UILabel!
    @IBOutlet var kcal: UILabel!
    
    var mealNameCame = ""
    var crabsCame = ""
    var protinCame = ""
    var fatCame = ""
    var timeCame = ""

 
    
    @IBAction func deleteDATA(_ sender: Any) {
        print("delete ");
        var flag = DatabaseManager.getInstance().deleteData(withID: mealNameCame)
        print(flag)
    }
    
    
    @IBAction func editData(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MealEdit") as? EditViewController{
            vc.foodnameCame = mealNameCame
            vc.amtCarbsCame = crabsCame
            vc.amtProtinCame = protinCame
            vc.amtFatCame = fatCame
            vc.timeCame = timeCame
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        print("edit");
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(timeCame)

        foodName.text = mealNameCame
        carbs.text = crabsCame
        protin.text = protinCame
        fat.text = fatCame
        time.text = timeCame
        let carbsInt = Int(crabsCame) ?? 0
        let protinInt = Int(protinCame) ?? 0
        let fatInt = Int(fatCame) ?? 0
        let totalInt:String = String(carbsInt+protinInt+fatInt)
        kcal.text = totalInt
        
        print(mealNameCame)
        print(crabsCame)
        
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
