import SwiftUI

struct ImageView: View {
    var meal: Meals
    var body: some View {
        if   meal.strMealThumb != ""{
            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { img in
                img
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 1, maxWidth: .infinity, minHeight: 1, maxHeight: .infinity)

            } placeholder: {
                ProgressView()
               
            }
        }  else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, height: .infinity)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(meal: .mealExample)
    }
}
