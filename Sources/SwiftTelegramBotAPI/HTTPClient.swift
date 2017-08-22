import Foundation
import Result


public enum HTTPClientError: Error {
    case error(Error)
}


public protocol HTTPClient {
    func send(request: URLRequest, completion: @escaping (Result<Data, HTTPClientError>) -> Void)
}
