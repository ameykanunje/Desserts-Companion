//
//  Dessert.swift
//  Desserts Companion
//
//  Created by csuftitan on 4/3/24.
//

struct Dessert : Decodable{
    var meals : [Meals]
}

struct Meals : Decodable{
    var strMeal : String
    var strMealThumb : String
    var idMeal : String
}
