//
//  MainProductApis.swift
//  Corekit
//
//  Created by Mostafa on 13/05/2025.
//

import Foundation

public final class MainProductApis: ProductApis {

    // MARK: - Properties
    
    // MARK: - Methods
    
    public init() {}

    public func getAllProducts() async throws -> ProductList {
        try await request(ProductService.getAllProducts)
    }
}

