//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Wynn Bailey on 11/23/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        TabView {
            // loop show featured
            ForEach(0..<model.recipes.count){ index in
                if model.recipes[index].featured == true {
                    Rectangle()                }
              
            }
           
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        // add the enviorment objecy
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
