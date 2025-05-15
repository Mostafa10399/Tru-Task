import UIKit
import Corekit
import Combine
import Commons
import CombineCocoa

public class HomeRootViewController: NiblessViewController {

    // MARK: - Properties
    
    private let viewModel: HomeRootViewModel
    private let customView: HomeRootView
    // DataSource & DataSourceSnapShot TypeAlias
    typealias DataSource = UITableViewDiffableDataSource<String, Product>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<String, Product>
    
        
    // DataSource & DataSourceSnapShot
    private lazy var datasource = makeDataSource()
    private var datasourceSnapShot = DataSourceSnapshot()

    // State
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Methods
    init(view: HomeRootView, viewModel: HomeRootViewModel) {
        self.viewModel = viewModel
        self.customView = view
        super.init()
    }

    override public func loadView() {
        view = customView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
//        observeErrorMessages()
        bindViewModel()
        viewModel.getData()
        customView.tableView.didSelectRowPublisher.receive(subscriber: viewModel.selectedItemSubscriber)
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func bindViewModel() {
        viewModel.productsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                guard let self else { return }
                self.updateSnapshot(with: products)
            }
            .store(in: &cancellables)
    }
    
//    private func observeErrorMessages() {
//        viewModel.errorMessagesPublisher
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] in
//                guard let self = self else { return }
//                self.present(
//                    errorMessage: $0,
//                    withPresentationState: self.viewModel.errorPresentation
//                )
//            }
//            .store(in: &cancellables)
//    }
}

// MARK: - Data Source Management
extension HomeRootViewController {
    private func makeDataSource() -> DataSource {
        return UITableViewDiffableDataSource(tableView: customView.tableView) { tableView, indexPath, product in
            print(ProductCell.reuseIdentifier)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell else {
                return UITableViewCell()
            }
            cell.configure(with: product)
            return cell
        }
    }
    
    private func updateSnapshot(with products: ProductList) {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections(["Main"])
        snapshot.appendItems(products, toSection: "Main")
        datasource.apply(snapshot, animatingDifferences: false)
    }
}


