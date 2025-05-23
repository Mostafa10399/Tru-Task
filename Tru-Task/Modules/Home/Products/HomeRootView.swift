import UIKit
import SnapKit
import Commons

class HomeRootView: NiblessView {

    // MARK: - Properties

    let segmentedControl = UISegmentedControl(items: ["List", "Grid"]).with {
        $0.selectedSegmentIndex = 0
    }

    let tableView = UITableView(frame: .zero, style: .plain).with {
        $0.register(ProductCell.nib, forCellReuseIdentifier: ProductCell.reuseIdentifier)
        $0.backgroundColor = .clear
        $0.backgroundView = nil
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 600
        $0.separatorStyle = .none
        $0.contentInsetAdjustmentBehavior = .never
        if #available(iOS 13.0, *) {
            $0.automaticallyAdjustsScrollIndicatorInsets = false
        }
        $0.contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10) + 10,
            right: 0
        )
        $0.tableFooterView = UIView()
    }

    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().with {
            let spacing: CGFloat = 10
            let screenWidth = UIScreen.main.bounds.width
            let totalSpacing = spacing * 3
            let itemWidth = (screenWidth - totalSpacing) / 2.5
            $0.itemSize = CGSize(width: itemWidth, height: 250)
            $0.minimumLineSpacing = spacing
            $0.minimumInteritemSpacing = spacing
            $0.scrollDirection = .vertical
        }
    ).with {
        $0.register(ProductCollectionCell.nib, forCellWithReuseIdentifier: ProductCollectionCell.reuseIdentifier)
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
        if #available(iOS 13.0, *) {
            $0.automaticallyAdjustsScrollIndicatorInsets = false
        }
        $0.contentInset = UIEdgeInsets(
            top: 0,
            left: 10,
            bottom: (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10) + 10,
            right: 10
        )
        $0.isHidden = true
    }

    private lazy var contentStackView = UIStackView().with {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fill
        $0.alignment = .fill
        $0.addArrangedSubview(segmentedControl)
        let container = UIView()
        container.addSubview(tableView)
        container.addSubview(collectionView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        $0.addArrangedSubview(container)
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
        addSubview(contentStackView)
    }

    private func activateConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.bottom.equalToSuperview()
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
    }

    private func styleView() {
        backgroundColor = .white
    }

}
