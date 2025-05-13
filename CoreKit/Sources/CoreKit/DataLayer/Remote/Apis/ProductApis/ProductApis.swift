//
//  ProductApis.swift
//  Corekit
//
//  Created by Mostafa on 13/05/2025.
//

import Foundation
import protocol NetworkLayer.RemoteAPI

public protocol ProductApis: RemoteAPI {
    func getAllProducts() async throws -> ProductList
}
