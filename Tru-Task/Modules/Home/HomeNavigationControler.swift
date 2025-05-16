import UIKit
import Corekit
import Commons
import Combine

final class HomeViewController: NiblessNavigationController {
    
    // MARK: - Properties
    
    private let viewModel: HomeNavigationViewModel
    private let rootViewController: HomeRootViewController
    private let makeProductDetailsViewController: ((Product) -> ProductDetailsViewController)

    private var cancelable: Set<AnyCancellable> = []
    
    // MARK: - Methods
    
    init(
        viewModel: HomeNavigationViewModel,
        rootViewController: HomeRootViewController,
        productDetailsViewControllerFactory: @escaping (Product) -> ProductDetailsViewController

    ) {
        self.viewModel = viewModel
        self.rootViewController = rootViewController
        self.makeProductDetailsViewController = productDetailsViewControllerFactory
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
        viewControllers = [rootViewController]
    }
    
    private func observeViewModel() {
        let publisher = viewModel.$view.eraseToAnyPublisher()
        subscriber(to: publisher)
    }
    
    private func subscriber(to publisher: AnyPublisher<HomeView, Never>) {
        publisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] view in
                guard let strongSelf = self else {return}
                strongSelf.present(view)
            }
            .store(in: &cancelable)
    }
    
    private func present(_ view: HomeView) {
        switch view {
        case .root:
            presentHomeRootView()
        case let .details(product):
            presentProductDetails(product: product)
        }
    }
    
    private func presentHomeRootView() {
        popToRootViewController(animated: false)
    }
    
    private func presentProductDetails(product: Product) {
        pushViewController(makeProductDetailsViewController(product), animated: true)
    }
}
