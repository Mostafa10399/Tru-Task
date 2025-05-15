import UIKit
import Corekit
import Commons
import Combine

final class HomeViewController: NiblessNavigationController {
    
    // MARK: - Properties
    
    private let viewModel: HomeNavigationViewModel
    private let rootViewController: HomeRootViewController
    private var cancelable: Set<AnyCancellable> = []
    
    // MARK: - Methods
    
    init(
        viewModel: HomeNavigationViewModel,
        rootViewController: HomeRootViewController
    ) {
        self.viewModel = viewModel
        self.rootViewController = rootViewController
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
        case .details:
            print("Details")
        }
    }
    
    private func presentHomeRootView() {
        popToRootViewController(animated: false)
    }
}
