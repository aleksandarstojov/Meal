import SwiftUI

struct CategoryMealsView: View {
    @ObservedObject var categoriesMealModel = CategoriesMealModel()
    //@EnvironmentObject var meals: MealResponse
    var mealName: String
    var body: some View {

        ScrollView(.vertical) {
                VStack {
                    ForEach(categoriesMealModel.mealArray ?? []) { meal in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: MealDetailView(id: meal.idMeal ?? ""), label: {
                            HStack {
                                ImageView(meal: meal)
                                    .frame(width: 50, height: 50)
                                Text(meal.strMeal ?? "")
                                    .font(.system(.title, design: .serif))
                                    .foregroundColor(.black)
                            } // HStack
                            .padding(.horizontal, -15)
                        }) //NavigationLink
                        Divider()
                    } // VStack
                } // ForEach
            } // VStack
            .task {
                await categoriesMealModel.fetchCategoryMeals(categoryName: mealName)
            }// Task
        }// ScrolView
    }
}
struct CategoryMealsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryMealsView(mealName: "Desserts")
        
    }
}
