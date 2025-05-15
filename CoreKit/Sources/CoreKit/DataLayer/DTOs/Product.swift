//
//  Product.swift
//  CoreKit
//
//  Created by Mostafa on 13/05/2025.
//

import Foundation

public struct Product: Codable, Sendable, Hashable {
    public let id: Int
    public let title: String
    public let price: Double
    public let description, category: String
    public let image: URL?
    public let rating: Rating
}

public typealias ProductList = [Product]
