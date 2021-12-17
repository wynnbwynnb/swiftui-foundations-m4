//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Wynn Bailey on 2021-11-10.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
        
    }
    /*
     How much rice for 10 portions where recipe is for 6
     How much rice for 1 portion
     Rice for 6 portions = 3/2
     denomitor * recipe serving size equals
     Rice for 1 portion = 3/(2*6) = 3/12
     Rice for target portions is target * numerator (3*10)/12 = 30/12
     Greatest common divisor of 30 and 12 is 6 so 30/12 = 5/2
     Reduce to whole number if possible so where 5/2 is 2 with a remainder of 1 so 5/2 = 2 1/2
     */
    // This is static so we can call without creating a new Recipe
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        //
        // Lets see if we have something to work with
        //
        if ingredient.num != nil {
            // Get a single serving size by mulitiplying denominator by the recipe servings
            denominator *= recipeServings
            // Get target portion by multiplying numberator by target servings
            numerator *= targetServings
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            // Get the whole portion if numerator > denominator
            if(numerator >= denominator){
                // calc whole portion
                wholePortions = numerator / denominator
                // calc remainder
                numerator = numerator % denominator
                // assign to string
                portion += String(wholePortions)
                
            }
            // Express the remainder as a fraction
            if(numerator > 0){
                portion += wholePortions > 0 ? " " : "" // adds space if needed for formatting
                portion += "\(numerator)/\(denominator)"
            }
        }
        // plural?
        if var unit = ingredient.unit {
            if (wholePortions > 1){
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" { // leaf to leaves
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
}
