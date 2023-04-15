//
//  TableViewController.swift
//  Calories Tracker
//
//  Created by Ankan Saha on 25/12/22.
//

import UIKit

class TableViewController: UIViewController {
    
    var meals = DatabaseManager.getInstance().fetchData()
    
    @IBOutlet var table: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate=self
        table.dataSource=self
        
        // Do any additional setup after loading the view.
    }
}
    
    extension TableViewController: UITableViewDelegate{
        
        func tableView(_ table: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("from sender")
            if let vc = storyboard?.instantiateViewController(withIdentifier: "MealDetails") as? MealDetails{
                
                vc.mealNameCame = meals[indexPath.row].food_name
                vc.crabsCame = meals[indexPath.row].amtCarbs
                vc.protinCame = meals[indexPath.row].amtPortin
                vc.fatCame = meals[indexPath.row].amtFat
                vc.timeCame=meals[indexPath.row].time

                print(vc.mealNameCame)
                print(meals[indexPath.row].food_name)
                        
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = meals[indexPath.row].food_name
        
        return cell
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

