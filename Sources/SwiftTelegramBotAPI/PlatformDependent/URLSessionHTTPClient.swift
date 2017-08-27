#if os(macOS)

import Foundation
import Result


public class URLSessionHTTPClient: HTTPClient {
    public let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    public func send(request: URLRequest, completion: @escaping (Result<Data, ErrorBox>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            var result: Result<Data, ErrorBox>
            defer {
                completion(result)
            }
            if let error = error {
                result = .failure(ErrorBox(error))
                return
            }
            result = .success(data ?? Data())
        }
        task.resume()
    }
}

#endif
