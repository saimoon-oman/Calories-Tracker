//
//  DatabaseManager.swift
//  Calories Tracker
//
//  Created by Ankan Saha on 25/12/22.
//

import Foundation
import SwiftUI

var shareInstance = DatabaseManager()

class DatabaseManager: NSObject{
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> DatabaseManager{
        if shareInstance.database == nil
        {
            shareInstance.database = FMDatabase(path: Util.getPath("calories_tracker.db"))
        }
        return shareInstance
    }
    
    func saveMeal(_ modelInfo:meal_model)->Bool{
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO meal(food_name,amt_carbs,amt_Protin,amt_Fat,time) VALUES (?,?,?,?,?)", withArgumentsIn: [modelInfo.food_name, modelInfo.amtCarbs, modelInfo.amtPortin, modelInfo.amtFat, modelInfo.time])
        shareInstance.database?.close()
        return isSave!
    }
    
    func fetchData() -> [meal_model]
    {
        shareInstance.database?.open()
        _ = "SELECT * FROM meal;"

        var meals: [meal_model]!

        if ((shareInstance.database?.open()) != nil)
        {
            let query = "select * from meal"

            do {
                let results = try shareInstance.database?.executeQuery(query, values:nil)


                while (true)
                {
                    results?.next()
                    let meal = meal_model(food_name: results?.string(forColumn: "food_name") ?? "none", amtCarbs: results?.string(forColumn: "amt_carbs") ?? "none", amtPortin: results?.string(forColumn: "amt_Protin") ?? "none", amtFat: results?.string(forColumn: "amt_Fat") ?? "none", time: results?.string(forColumn: "time") ?? "none")

                    if meals == nil {
                        meals = [meal_model]()
                    }
                    if (meal.food_name == "none")
                    {
                        break
                    }

                    print(meal.food_name)

                    meals.append(meal)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }


        return meals
    }
    
    func deleteData(withID NAME: String) -> Bool {
        var deleted = false
        
        if ((shareInstance.database?.open()) != nil)
        {
            let query = "delete from meal where food_name like '\(NAME)';"
//            print(query)
            
            do{
                try shareInstance.database?.executeUpdate(query, values: nil)
                deleted = true
            }
            catch{
                print(error.localizedDescription)
            }
        }
        return deleted
    }
    
    func editData(old_food_name: String, food_name: String, amt_carbs: String, amt_Protin: String, amt_Fat: String,time: String ) -> Bool{
        var edited = false
        if(shareInstance.database?.open() != nil)
        {
            let query = "update meal set food_name = '\(food_name)', amt_carbs = '\(amt_carbs)', amt_Protin = '\(amt_Protin)', amt_Fat = '\(amt_Fat)', time = '\(time)' where food_name = '\(old_food_name)';"
//            print(query)
            
            do{
                try shareInstance.database?.executeUpdate(query, values: nil)
                edited = true
            }
            catch{
                print(error.localizedDescription)
            }
        }
        
        return edited
    }
    
}
