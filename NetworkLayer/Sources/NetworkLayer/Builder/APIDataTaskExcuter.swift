import Foundation
import Alamofire

extension DataTask: APIErrorHandler {
    func executed<T: SendableCodable>(type: T.Type) async throws -> T {
        do {
            let response = await self.result
            switch response {
            case let .success(data):
                return data as! T
            case let .failure(error):
                throw handleNetworkResponse(error)
            }
        } catch {
            throw error
        }
    }
}
