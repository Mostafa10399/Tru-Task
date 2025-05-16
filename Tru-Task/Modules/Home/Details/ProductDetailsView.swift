import UIKit
import SnapKit
import Commons

public final class ProductDetailsView: NiblessView {

    // MARK: - UI Components

    let scrollView = UIScrollView().with {
        $0.showsVerticalScrollIndicator = false
    }

    private let contentView = UIView()

    let productImageView = UIImageView().with {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
    }

    let categoryLabel = UILabel().with {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .darkGray
        $0.numberOfLines = 0
    }

    let priceLabel = UILabel().with {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .systemGreen
        $0.numberOfLines = 0
    }

    let descriptionLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.numberOfLines = 0
    }

    private lazy var contentStackView = UIStackView().with {
        $0.axis = .vertical
        $0.spacing = 16
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.addArrangedSubview(productImageView)
        $0.addArrangedSubview(categoryLabel)
        $0.addArrangedSubview(priceLabel)
        $0.addArrangedSubview(descriptionLabel)
    }

    // MARK: - Init

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        constructHierarchy()
        activateConstraints()
        styleView()
    }

    // MARK: - Methods

    private func constructHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(contentStackView)
    }

    private func activateConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }

        productImageView.snp.makeConstraints { make in
            make.height.equalTo(250)
        }
    }

    private func styleView() {
        backgroundColor = .white
    }
}
