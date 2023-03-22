import Foundation

protocol Endpoint {
    
    var url: String? { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var method: HTTPMethod { get }
    var timeoutInterval: Double { get }
    
}

extension Endpoint {
    var url: String? {nil}
    var queryItems: [URLQueryItem]? {[]}
    var timeoutInterval: Double { 60.0 }
    
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POSTS"
    case put = "PUT"
    case delete = "DELETE"
    
}

enum RequestType {
    case getMealByName(String)
    case getAllCategories
    case getMealsFromCategory(String)
    case lookUpMealByID(String)
}

extension RequestType: Endpoint {
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getMealByName(let mealName):
            return [URLQueryItem(name: "s", value: mealName)]
        case .getAllCategories:
            return []
        case .getMealsFromCategory(let categoryName):
            return [URLQueryItem(name: "c", value: categoryName)]
        case .lookUpMealByID(let mealID):
            return [URLQueryItem(name: "i", value: mealID)]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMealByName: return .get
        case .getAllCategories: return .get
        case .getMealsFromCategory: return .get
        case .lookUpMealByID: return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMealByName: return "search.php"
        case .getAllCategories: return "categories.php"
        case .getMealsFromCategory: return "filter.php"
        case .lookUpMealByID: return "lookup.php"
        }
    }
}

// MARK: Delegate Protocol
protocol ProtocolDelegateFunction {
    func getMealByName(mealName: String) async throws -> MealResponse
    func getAllCategories() async throws -> CategoryResponse
    func getMealsFromCategory(category: String) async throws -> MealResponse
    func lookUpMealByID(mealID: String) async throws -> MealResponse
}
