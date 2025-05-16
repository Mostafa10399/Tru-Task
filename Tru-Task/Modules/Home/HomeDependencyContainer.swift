import Foundation
import Corekit

@MainActor
class HomeDependencyContainer {
    
    // MARK: - Properties
    
    // Long-lived dependencies
    private let sharedHomeViewModel: HomeNavigationViewModel
    
    init() {
        func makeHomeViewModel() -> HomeNavigationViewModel {
            return HomeNavigationViewModel()
        }
        
        self.sharedHomeViewModel = makeHomeViewModel()
    }
    
    public func makeHomeViewController() -> HomeViewController {
        let productDetailsViewControllerFactory = { product in
            let viewModel = self.makeProductDetailsViewModel(product: product)
            return self.makeProductDetailsViewController(viewModel: viewModel)
        }
        return HomeViewController(viewModel: sharedHomeViewModel,
                                  rootViewController: makeRootViewController(),
                                  productDetailsViewControllerFactory: productDetailsViewControllerFactory)
    }
    
    private func makeRootViewController() -> HomeRootViewController {
        HomeRootViewController(
            view: makeHomeRootView(),
            viewModel: makeHomeRootViewModel()
        )
    }
    
    private func makeHomeRootViewModel() -> HomeRootViewModel {
        HomeRootViewModel(
            repository: MainProductRepository(remoteApi: MainProductApis()),
            navigator: sharedHomeViewModel
        )
    }
    
    private func makeHomeRootView() -> HomeRootView {
        HomeRootView()
    }
    
    private func makeProductDetailsViewModel(product: Product) -> ProductDetailsViewModel {
        ProductDetailsViewModel(product: product)
    }
    
    private func makeProductDetailsViewController(viewModel: ProductDetailsViewModel) -> ProductDetailsViewController{
        ProductDetailsViewController(view: ProductDetailsView(), viewModel: viewModel)
    }
}
