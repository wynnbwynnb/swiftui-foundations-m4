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
}
