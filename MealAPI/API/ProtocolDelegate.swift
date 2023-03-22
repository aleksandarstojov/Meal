import Foundation
 
final class ProtocolDelegate: ProtocolDelegateFunction {
    
    @Published var protocolDelegate = NetworkManager()
    // static let shared = ProtocolDelegate()
    
    
    func getAllCategories() async throws -> CategoryResponse {
        let task = RequestType.getAllCategories
        return try await protocolDelegate.fetch(result: task)
    }
    
    func getMealByName(mealName: String) async throws -> MealResponse {
        let task = RequestType.getMealByName(mealName)
        return try await protocolDelegate.fetch(result: task)
    }

    func getMealsFromCategory(category: String) async throws -> MealResponse {
        let task = RequestType.getMealsFromCategory(category)
        return try await protocolDelegate.fetch(result: task)
    }

    func lookUpMealByID(mealID: String) async throws -> MealResponse {
        let task = RequestType.lookUpMealByID(mealID)
        return try await protocolDelegate.fetch(result: task)
    }
}
