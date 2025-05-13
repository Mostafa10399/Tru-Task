import Foundation
import protocol NetworkLayer.RemoteService

 protocol TruService: RemoteService {
    var mainRoute: String { get }
}

 extension TruService {
    var baseUrl: String {
        return "https://fakestoreapi.com"
    }
}
