import Foundation
import Alamofire

public typealias SendableCodable = Codable & Sendable
public protocol RemoteAPI {
    func request<T: SendableCodable>(_ service: RemoteService) async throws -> T
}

extension RemoteAPI {
    public func request<T: SendableCodable>(_ service: RemoteService) async throws -> T {
        try await AF
            .request(service)
            .validate(statusCode: 200..<400)
            .serializingDecodable(T.self)
            .executed(type: T.self)
    }
}
