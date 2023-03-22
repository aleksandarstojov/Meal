import SwiftUI

struct HomeScreenView: View {
    @State private var mealNameSearch = ""
    @StateObject var searchViewModel = SearchViewModel()
    //@FocusState var isFocused: Bool
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CategoriesListView(), label: {
                    VStack {
                        Image(systemName: "square.split.1x2.fill")
                            .bold()
                            .frame(width: 60, height: 60)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Text("CATEGORIES")
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                    .searchable(text: $mealNameSearch)
                })
            }
            .accentColor(Color(.label))

        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
