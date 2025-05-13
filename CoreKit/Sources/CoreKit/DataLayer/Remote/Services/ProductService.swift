import Foundation
import NetworkLayer

enum ProductService {
    case getAllProducts
}

extension ProductService: TruService {
    
    var mainRoute: String { return "" }
    
    public var requestConfiguration: RequestConfiguration {
        switch self {
        case .getAllProducts:
            return RequestConfiguration(
                path: mainRoute.appending("products"),
                parameters: ["limit": 7],
                encoding: UrlEncoding.queryString
            )
        }
    }
}
