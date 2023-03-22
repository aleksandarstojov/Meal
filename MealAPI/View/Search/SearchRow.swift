//
//  SearchRow.swift
//  MealAPI
//
//  Created by Aleksandar Stojov on 3/26/23.
//

import SwiftUI

struct SearchRow: View {
    
    var meal: Meals
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(meal.strMeal ?? "")
                    .font(.title2.weight(.semibold))
                Text(meal.strCategory ?? "")
            }
        }
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchRow(meal: .mealExample)
            .previewLayout(.sizeThatFits)
    }
}
