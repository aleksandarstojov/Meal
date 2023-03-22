import SwiftUI

struct MealDetailView: View {
    @StateObject var mealSearch = SearchViewModel()
    // @State private var searchTerm = ""

    //var gotMeal: String
    var id: String = ""
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 0) {
                ForEach(mealSearch.array ) { mealArray in
                    // IMAGE
                    ImageView(meal: mealArray)
                        .overlay(
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Image(systemName: "heart")
                                        .imageScale(.large)
                                        .padding(.bottom, 20)
                                        .padding(.trailing, 20)
                                } // VStack
                            } // HStack
                        ) // overlay
                    
                    Group {
                        
                        Text(mealArray.strMeal ?? "")
                            .font(.system(.title, design: .serif))
                            .fontWeight(.bold)
                            .padding(10)
                            .multilineTextAlignment(.center)
                        Text("Meal Origin: \(mealArray.strArea ?? "")")
                            .font(.system(.callout, design: .serif))
                            .padding(.bottom, 10)
                        VStack(alignment: .center, spacing: 15) {
                            // TEXT
                            Text("Ingredients")
                                .font(.system(.title2, design: .serif))
                                .fontWeight(.bold)
                                .padding(10)
                            ForEach(mealArray.ingredients ?? [], id:\.self){ ingredient in
                                VStack(alignment: .center, spacing: 10) {
                                    HStack(alignment: .center, spacing: 5){
                                        Text(ingredient.measure)
                                            .foregroundColor(.gray)
                                            .font(.system(.subheadline, design: .serif))
                                            .fontWeight(.semibold)
                                        Text(ingredient.ingredient)
                                            .foregroundColor(.black)
                                            .font(.system (.subheadline, design: .serif))
                                        Spacer()
                                    }// HStack
                                    .padding(.horizontal, 15)
                                    
                                    Divider()
                                    
                                }// VStack
                            }// ForEach
                        } // VStack
                        
                        Divider()
                        
                        VStack(alignment: .center, spacing: 15) {
                            Text("Instructions")
                                .font(.system(.title2, design: .serif))
                                .fontWeight(.bold)
                                .padding(10)
                            Text(mealArray.strInstructions ?? "")
                                .foregroundColor(.black)
                                .font(.system (.subheadline, design: .serif))
                        } //VStack
                        .padding(20)
                    }//Group
                } //VStack
            }
            .task {
                await mealSearch.search(mealID: id)
            }// Task
        }//ScrollView
        .edgesIgnoringSafeArea(.top)
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(id: "")
    }
}
