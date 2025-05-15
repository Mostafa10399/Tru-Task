protocol GetProductsUsecase {
    var repository: ProductRepository { get }
    func getProducts() async throws -> [Product]
}

extension GetProductsUsecase {
    func getProducts() async throws -> [Product] {
        try await repository.getAllProducts()
    }
}
