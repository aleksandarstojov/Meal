//
//  SearchView.swift
//  MealAPI
//
//  Created by Aleksandar Stojov on 3/23/23.
//

import SwiftUI

struct SearchView: View {

    @StateObject var viewModel = SearchObject()
    @State private var mealName = ""
    var searchResult: [Meals] = []

    var body: some View {

        NavigationView{

            VStack {

                Text("Find a meal")
                    .font(.title.weight(.bold))
                Text("Search meal by name.")

            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            .searchable(text: $mealName) {
                ForEach(viewModel.searchResult) { meal in
                    SearchRow(meal: meal)
                }
            }
            .onChange(of: mealName) { mealName in
                viewModel.searchResult = viewModel.mealData.filter({ meal in
                    meal.strMeal?.lowercased().contains(mealName.lowercased()) ?? false
                })
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
