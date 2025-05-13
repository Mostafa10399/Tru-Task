import Foundation

public protocol ProductRepository {
    func getAllProducts() async throws -> ProductList
}
