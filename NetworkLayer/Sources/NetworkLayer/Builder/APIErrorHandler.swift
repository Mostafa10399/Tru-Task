import Foundation
import Alamofire

public protocol APIErrorHandler {
    func handleNetworkResponse(_ error: AFError) -> APIError
}

extension APIErrorHandler {
    public func handleNetworkResponse(_ error: AFError) -> APIError {
        switch error {
        case let .responseValidationFailed(reason):
            return statusCodeChecker(reason)
        case let .responseSerializationFailed(reason):
            return serializationChecker(reason)
        default:
            break
        }
        return APIError.badRequest
    }
    
    fileprivate func serializationChecker(_ reason: AFError.ResponseSerializationFailureReason) -> APIError {
        switch reason {
        case .decodingFailed:
            return APIError.decodingError
        default:
            break
        }
        return APIError.badRequest
    }
    
    
    fileprivate func statusCodeChecker(_ reason: AFError.ResponseValidationFailureReason) -> APIError {
        switch reason {
        case let .unacceptableStatusCode(code):
            switch code {
            case 401...500:
                return APIError.unAuthorized
            case 501...599:
                return APIError.badRequest
            case 600:
                return APIError.outdated
            default:
                return APIError.badRequest
            }
        default:
            return APIError.badRequest
        }
    }
}
