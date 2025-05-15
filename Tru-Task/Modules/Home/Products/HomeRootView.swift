//
//  PopularMoviesView.swift
//  Movies-Task
//
//  Created by Mostafa on 19/02/2025.
//


import UIKit
import Commons

class HomeRootView: NiblessView {

    // MARK: - Properties

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
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10) + 10, right: 0)
        $0.tableFooterView = UIView()
    }
    
    // MARK: - Methods
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        constructHierarchy()
        activateConstraints()
        styleView()
    }

    private func constructHierarchy() {
        addSubview(tableView)
    }

    private func activateConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func styleView() {
        backgroundColor = .white
    }
}
