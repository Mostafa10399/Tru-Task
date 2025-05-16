import Foundation
import Combine

public class HomeNavigationViewModel: GoToProductDetails {

    // MARK: - Properties
    
    @Published public var view: HomeView

    // MARK: - Methods
    
    public init() {
        view = .root
    }
    
    public func navigateToProductDetails(with product: Product) {
        view = .details(product: product)
    }
}

public protocol GoToProductDetails {
    func navigateToProductDetails(with product: Product)
}
