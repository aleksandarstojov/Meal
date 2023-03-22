import Foundation

struct CategoryResponse: Codable {
    let categories: [Categories]
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
    }
}

struct Categories: Codable, Identifiable {
    
    var idCategory: String?
    var strCategory: String?
    var strCategoryThumb: String?
    var id: String? { idCategory }
}

//extension Categories {
//    init(from decoder: Decoder) throws {
//        let contailer = try decoder.singleValueContainer()
//        let categories = try contailer.decode([String: String?].self)
//
//        strCategory = categories["strCategory"] as? String ?? ""
//        strCategoryThumb = categories["strCategoryThumb"] as? String ?? ""
//        idCategory = categories["idCategory"] as? String ?? ""
//    }
//}

extension Categories {
    static let categoryExample = Categories(
        idCategory: "1",
        strCategory: "Beef",
        strCategoryThumb: "https://www.themealdb.com/images/category/beef.png")
}
