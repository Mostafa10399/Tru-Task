import UIKit

@MainActor
public protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

public extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }

    static var nib: UINib {
        UINib(nibName: reuseIdentifier, bundle: .module)
    }
}
