//
//  coldCoffeeEntity.swift
//  MakeCoffeeApp
//
//  Created by macbook pro on 16.11.2023.
//

import Foundation


struct ColdCoffee: Codable {
    let title, description: String
    let ingredients: [String]
    let image: String
    let id: Int
}

typealias Cold = [ColdCoffee]
