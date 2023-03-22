import SwiftUI

struct CategoryImageView: View {
    var category: Categories
    var body: some View {
        if   category.strCategoryThumb != ""{
            AsyncImage(url: URL(string: category.strCategoryThumb ?? "")) { img in
                img
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)

            } placeholder: {
                ProgressView()
               
            }
        }  else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
        }
    }
}

struct CategoryImageView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImageView(category: .categoryExample)
    }
}
