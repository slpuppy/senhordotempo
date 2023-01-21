import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol ApiEndpoint {
    var domain: String { get }
    var pathPrefix: String { get }
    var path: String { get }
    var body: Data? { get }
    var method: HTTPMethod { get }
    var query: [String: String]? { get }
}

