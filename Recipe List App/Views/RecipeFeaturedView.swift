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
        VStack(alignment:.leading) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            GeometryReader { geo in
                TabView {
                    // loop show featured
                    ForEach(0..<model.recipes.count){ index in
                        if model.recipes[index].featured == true {
                            ZStack {
                                Rectangle().foregroundColor(.white)
                                    
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable().clipped()
                                        .aspectRatio(contentMode: .fill)
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }.frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color:.black, radius: 10, x:-5, y:5)
                            
                        }
                      
                    }
                // show the dots for swiping
                }.tabViewStyle(.page(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode:.always))
            }
            VStack(alignment: .leading, spacing: 10){
                Text("Preperation Time:").font(.headline)
                Text("2 hours")
                Text("Highlights:").font(.headline)
                Text("Frozen from Supermarket")
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
