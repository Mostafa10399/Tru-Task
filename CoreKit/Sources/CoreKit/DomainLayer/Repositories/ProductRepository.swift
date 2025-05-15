import Foundation

public protocol ProductRepository: Sendable {
    func getAllProducts() async throws -> ProductList
}
