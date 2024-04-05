import SwiftUI

struct DessertDetailsView: View {
    private var dessertsViewModel: DessertDetailsViewModel
    let mealID: String

    init(mealID: String) {
        self.mealID = mealID
        self.dessertsViewModel = DessertDetailsViewModel()
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 20) {
                    if let mealDetails = dessertsViewModel.mealDetails {
                        // Dessert Name
                        Text(mealDetails.strMeal)
                            .font(.title)
                        
                        // Image
                        if let imageURL = URL(string: mealDetails.strMealThumb) {
                            AsyncImage(url: imageURL) { image in
                                image.resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 200, height: 200)

                        }
                        
                        // Instructions
                        Text("Instructions:")
                            .font(.system(size:22,weight:.bold))
                        Text(mealDetails.strInstructions)
                            .font(.body)
                        
                        
                        // Ingredients
                        Text("Ingredients:")
                            .font(.system(size:22,weight:.bold))
                        ForEach(getIngredients(mealDetails: mealDetails).indices, id: \.self) { index in
                            let (ingredient, measure) = getIngredients(mealDetails: mealDetails)[index]
                                if !ingredient.isEmpty, !measure.isEmpty {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("\(ingredient) : \(measure)")
                                            .font(.body)
//                                        Text(measure)
//                                            .font(.subheadline)
                                    }
                            }
                        }
                    } else {
                        Text("Loading...")
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Dessert Details")
        .onAppear {
            dessertsViewModel.fetchDessertDetailsData(mealID: mealID)
        }
    }
    
    // Function to get non-empty ingredient names
    private func getIngredients(mealDetails: MealDetails) -> [(String, String)] {
        return mealDetails.ingredientsWithMeasures
    }
}

#if DEBUG
struct DessertDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailsView(mealID: "52893")
    }
}
#endif
