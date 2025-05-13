import Foundation

public final class MainProductRepository: ProductRepository {
    
    // MARK: - Properties
    
    private let remoteApi: ProductApis

    // MARK: - Methods
    
    public init(remoteApi: ProductApis) {
        self.remoteApi = remoteApi
    }
    
    public func getAllProducts() async throws -> ProductList {
        try await remoteApi.getAllProducts()
    }
    
}
