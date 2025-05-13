import Foundation

public enum APIError: Error {
    case badRequest
    case serverError(statusCode: Int)
    case tooManyRequests(remaining: Int)
    case unAuthorized
    case decodingError
    case timeout
    case noInternetConnection
    case unknown(Error)
    case emptyDate
    case outdated
    
    public var localizedDescription: String {
        switch self {
        case .badRequest:
            return "Invalid Request try again later"
        case let .serverError(statusCode):
            return "Server error with status code \(statusCode). Please try again later."
        case let .tooManyRequests(remaining):
            return "Too many requests. Please wait and try again. Remaining: \(remaining)."
        case .unAuthorized:
            return "Unauthorized access. Please check your credentials."
        case .decodingError:
            return "Decoding error."
        case .timeout:
            return "The request timed out. Please try again."
        case .noInternetConnection:
            return "No internet connection. Please check your network settings."
        case let .unknown(error):
            return "An unknown error occurred: \(error.localizedDescription)."
        case .outdated:
            return "Out dated"
        case .emptyDate:
            return "empty data"
        }
    }
}
