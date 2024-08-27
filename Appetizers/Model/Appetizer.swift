//
//  Appetizer.swift
//  Appetizers
//
//  Created by Prashanti Venna on 12/08/2024.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 6, 
                                           name: "Chicken Fingers",
                                           description: "You can never go wrong with some good tenders.",
                                           price: 9.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-fingers.jpg",
                                           calories: 675,
                                           protein: 9,
                                           carbs: 5)
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne     = Appetizer(id: 0001,
                                             name: "Test Appetizer One",
                                             description: "This is the description for my appetizer. It's yummy.",
                                             price: 9.99,
                                             imageURL: "",
                                             calories: 99,
                                             protein: 99,
                                             carbs: 99)
      
      static let orderItemTwo     = Appetizer(id: 0002,
                                             name: "Test Appetizer Two",
                                             description: "This is the description for my appetizer. It's yummy.",
                                             price: 9.99,
                                             imageURL: "",
                                             calories: 99,
                                             protein: 99,
                                             carbs: 99)
      
      static let orderItemThree   = Appetizer(id: 0003,
                                             name: "Test Appetizer Three",
                                             description: "This is the description for my appetizer. It's yummy.",
                                             price: 9.99,
                                             imageURL: "",
                                             calories: 99,
                                             protein: 99,
                                             carbs: 99)
      
      static let orderItems       = [orderItemOne, orderItemTwo, orderItemThree]
}
