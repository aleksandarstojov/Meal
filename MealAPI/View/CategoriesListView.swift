import SwiftUI
struct CategoriesListView: View {
    
    @ObservedObject var categoriesViewModel = CategoriesListModel()
    
    var body: some View {
        
        ScrollView(.vertical) {
                VStack {
                    ForEach(categoriesViewModel.categoryDetails) { category in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: CategoryMealsView(mealName: category.strCategory ?? ""), label: {
                            HStack {
                                CategoryImageView(category: category)
                                Text(category.strCategory ?? "")
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
                await categoriesViewModel.fetchCategories()
            }// Task
        }// ScrolView
    }
}

struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView()
    }
}
