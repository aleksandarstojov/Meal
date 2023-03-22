import Foundation

class SearchObject: ObservableObject {
    @Published var searchText = ""
    var mealData: [Meals] = []
    @Published var searchResult: [Meals] = []
    
    var mealDetailDelegate = ProtocolDelegate()
    
    init() {
        
        mealData = SearchViewModel.shared.getData()
        
    }
    
}
