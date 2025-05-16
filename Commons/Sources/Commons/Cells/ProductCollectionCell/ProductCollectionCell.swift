import UIKit
import Corekit
import Kingfisher

final public class ProductCollectionCell: UICollectionViewCell, Reusable {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    private(set) public var productId: Int?

    public func configure(with item: Product) {
        self.productId = item.id
        productImage.kf.setImage(
            with: item.image,
            placeholder: UIImage(named: "placeholderIcon")
        )
        productTitle.text = item.title
        rate.text = "\(item.rating.rate)"
        priceLabel.text = "\(item.price)"
    }

}
