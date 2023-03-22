import Foundation

//class MealDetailViewModel: ObservableObject {
//    var mealDetailDelegate = ProtocolDelegate()
//    @Published var mealDetails: [Meals] = []
//
//    @MainActor
//    func search(with mealName: String) async {
//        do {
//            mealDetails = try await mealDetailDelegate.getMealByName(mealName: mealName).meals ?? []
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//
//     }
//}

class SearchViewModel: ObservableObject {
    
    @Published var array: [Meals] = []
    @Published var id: String = ""
    var detailViewDelegate = ProtocolDelegate()
    public static let shared = SearchViewModel()
    
    
    func search(mealID: String) async {
        do {
            let m = try await detailViewDelegate.lookUpMealByID(mealID: mealID).meals ?? []
            DispatchQueue.main.async {
                self.array = m
            }
            
        } catch {
            
            print(error.localizedDescription)
        }
    }
    
    func getData() -> [Meals] {
        return array
    }

}

class CategoriesListModel: ObservableObject {
    
    @Published var categoryDetails: [Categories] = []
    var detailViewDelegate = ProtocolDelegate()
    @MainActor
    func fetchCategories() async {
            do {
                    let c = try await detailViewDelegate.getAllCategories().categories.sorted(by: {$0.strCategory ?? "" < $1.strCategory ?? "" })
                DispatchQueue.main.async {
                    self.categoryDetails = c
                }
                
            } catch {
                
                print (error.localizedDescription)
        }
    }
    
    func getCategoryData() -> [Categories] {
        return categoryDetails
    }
}

// show meals from specific category

class CategoriesMealModel: ObservableObject {
    @Published var mealArray: [Meals]? = []
    var detailViewDelegate = ProtocolDelegate()
    
 //   @MainActor
    func fetchCategoryMeals(categoryName: String) async  {
        do {
            let m = try await detailViewDelegate.getMealsFromCategory(category: categoryName).meals?.sorted(by: {$0.strMeal ?? "" < $1.strMeal ?? "" })
            DispatchQueue.main.async {
                self.mealArray = m
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

// search by typing name





