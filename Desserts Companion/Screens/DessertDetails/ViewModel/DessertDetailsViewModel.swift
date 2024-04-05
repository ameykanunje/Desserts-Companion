//
//  DessertDetailsViewModel.swift
//  Desserts Companion
//
//  Created by csuftitan on 4/4/24.
//

import Foundation
import SwiftUI

@Observable final class DessertDetailsViewModel{
    var mealDetails : MealDetails?
    var eventHandler : ((_ event : Event) -> Void)?
    
    func fetchDessertDetailsData(mealID: String){
        self.eventHandler?(.loading)
        APIManager.shared.request(
            modelType: DessertDetails.self,
            type: EndPointItems.DessertsDetails(mealID: mealID)) { response in
                self.eventHandler?(.stopLoading) //received the response
                
                switch response{
                case .success(let data):
                    self.mealDetails = data.meals.first
                    self.eventHandler?(.dataLoading)
                    
                case .failure(let error):
                    print("Data Loading Error")
                    self.eventHandler?(.error(error))
                }
            }
    }
    
}

extension DessertDetailsViewModel{
    
    enum Event{
        case loading
        case stopLoading
        case dataLoading
        case error(Error?)
    }
    
}
