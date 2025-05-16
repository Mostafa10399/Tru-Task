import UIKit
import Corekit
import Commons
import Combine
import Kingfisher

public class ProductDetailsViewController: NiblessViewController {

    // MARK: - Properties

    private let customView: ProductDetailsView
    private let viewModel: ProductDetailsViewModel
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init

    public init(view: ProductDetailsView, viewModel: ProductDetailsViewModel) {
        self.customView = view
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Lifecycle

    public override func loadView() {
        view = customView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        style()
        bindViewModel()
    }

    // MARK: - Binding

    private func bindViewModel() {
        self.configure(with: viewModel.product)
    }

    // MARK: - Configuration

    private func configure(with product: Product) {
        customView.productImageView.kf.setImage(with: product.image)
        customView.categoryLabel.text = "Category: \(product.category)"
        customView.priceLabel.text = "$\(product.price)"
        customView.descriptionLabel.text = product.description
    }

    private func style() {
        view.backgroundColor = .white
        title = "Product Details"
    }
}
