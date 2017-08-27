import Foundation
import Result


public protocol HTTPClient {
    func send(request: URLRequest, completion: @escaping (Result<Data, ErrorBox>) -> Void)
}
