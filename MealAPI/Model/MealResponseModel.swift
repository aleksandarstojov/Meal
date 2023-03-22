import Foundation

struct MealResponse: Decodable {
    
    let meals: [Meals]?
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}

struct Meals: Decodable, Identifiable {
    let id = UUID()
    let idMeal: String?
    let strMeal: String?
    let strCategory: String?
    let strInstructions: String?
    let ingredients: [Ingredient]?
    let strMealThumb: String?
    let strArea: String?
    
    // add area
    
}

struct Ingredient: Decodable, Hashable {
    let ingredient: String
    let measure: String
}

extension Meals {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let meal = try container.decode([String: String?].self)
        var index = 1
        var ingredients: [Ingredient] = []
        
        while let ingredient = meal["strIngredient\(index)"] as? String,
              let measure = meal["strMeasure\(index)"] as? String,
              !ingredient.isEmpty,
              !measure.isEmpty {
            
            ingredients.append(.init(ingredient: ingredient, measure: measure))
            index += 1
        }
            self.ingredients = ingredients
        idMeal = meal["idMeal"] as? String ?? ""
            strMeal = meal["strMeal"] as? String ?? ""
            strCategory = meal["strCategory"] as? String ?? ""
            strInstructions = meal["strInstructions"] as? String ?? ""
            strMealThumb = meal["strMealThumb"] as? String ?? ""
            strArea = meal["strArea"] as? String ?? ""
        
        }
    }

extension Meals {
    static let mealExample = Meals(idMeal: "2", strMeal: "Teriyaki Chicken Casserole", strCategory: "Chicken", strInstructions: "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray. Combine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling. Meanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat. Place the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks. *Meanwhile, steam or cook the vegetables according to package directions. Add the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!", ingredients: Meals.ingredientsExample, strMealThumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg", strArea: "Japanese")
}
extension Meals {
    static let ingredientsExample: [Ingredient]? = [
        Ingredient(ingredient: "soy sauce", measure: "3/4 cup"),
        Ingredient(ingredient: "water", measure: "1/2 cup"),
        Ingredient(ingredient: "brown sugar", measure: "1/4 cup"),
        Ingredient(ingredient: "ground ginger", measure: "1/2 teaspoon"),
        Ingredient(ingredient: "minced garlic", measure: "1/2 teaspoon"),
        Ingredient(ingredient: "cornstarch", measure: "4 Tablespoons"),
        Ingredient(ingredient: "chicken breasts", measure: "2"),
        Ingredient(ingredient: "stir-fry vegetables", measure: "1 (12 oz.)"),
        Ingredient(ingredient: "brown rice", measure: "3 cups")
    ]
}
