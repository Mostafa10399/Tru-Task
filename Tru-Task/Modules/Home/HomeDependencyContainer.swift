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
        return HomeViewController(viewModel: sharedHomeViewModel,
                                  rootViewController: makeRootViewController())
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
}
