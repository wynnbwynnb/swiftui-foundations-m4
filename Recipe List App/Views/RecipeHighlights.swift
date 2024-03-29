//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Wynn Bailey on 12/20/21.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    init(highlights:[String]){
       // loop through the highlights to build a comma seperated string
        for index in 0..<highlights.count {
            if index == highlights.count - 1{
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test1", "..."])
    }
}
