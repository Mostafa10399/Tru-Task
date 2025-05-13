//
//  Product.swift
//  CoreKit
//
//  Created by Mostafa on 13/05/2025.
//

import Foundation

public struct Product: Codable, Sendable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating
}

public typealias ProductList = [Product]
