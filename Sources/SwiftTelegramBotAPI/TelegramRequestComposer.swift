import Foundation


public enum ParamPassing {
    case urlQueryString
    case applicationFormURLEncoded
    case applicationJSON
    case multipartFormData // for now will support only this option
    
    var httpMethod: String {
        switch self {
        case .urlQueryString: return "GET"
        default: return "POST"
        }
    }
}


public protocol RequestComposer {
    func composeRequest(method: TelegramMethod, passing: ParamPassing, params: [String: Any]) throws -> URLRequest
}


public final class TelegramRequestComposer: RequestComposer {
    public let token: Token
    public static let baseURL = URL(string: "https://api.telegram.org/")!
    
    public init(token: Token) {
        self.token = token
    }
    
    public func composeRequest(method: TelegramMethod, passing: ParamPassing = .multipartFormData, params: [String : Any]) throws -> URLRequest {
        return try composeMultipartFormDataRequest(method: method, params: params)
    }
    
    private func composeURL(method: TelegramMethod) -> URL {
        let auth = "bot" + token.string
        return TelegramRequestComposer.baseURL.appendingPathComponent(auth).appendingPathComponent(method.string)
    }
    
    private func composeMultipartFormDataRequest(method: TelegramMethod, params: [String: Any]) throws -> URLRequest {
        let url = composeURL(method: method)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let boundary = String.createBoundary()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = try Data(multipartParams: params, boundary: boundary)
        return request
    }
}


//func makeBoundary() -> Data {
//    
//}
/*
func createBody(parameters: [String: String],
                boundary: String,
                data: Data,
                mimeType: String,
                filename: String) -> Data {
    let body = NSMutableData()
    
    let boundaryPrefix = "--\(boundary)\r\n"
    
    for (key, value) in parameters {
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
        body.appendString("\(value)\r\n")
    }
    
    body.appendString(boundaryPrefix)
    body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
    body.appendString("Content-Type: \(mimeType)\r\n\r\n")
    body.append(data)
    body.appendString("\r\n")
    body.appendString("--".appending(boundary.appending("--")))
    
    return body as Data
}
*/

/*
extension Data {
    enum EncodingError: Error {
        case error(String, String.Encoding)
    }
    
    mutating func append(string: String, with encoding: String.Encoding = .utf8) throws {
        guard let data = string.data(using: encoding) else {
            throw EncodingError.error(string, encoding)
        }
        self.append(data)
    }
    
    init(multipartParams: [String: Data], boundary: String) throws {
        self = Data()
        let prefixedBoundary = "--\(boundary)\r\n"
        for (key, value) in multipartParams {
            try self.append(string: prefixedBoundary)
            try self.append(string: "Content")
        }
    }
}
*/



/*
extension Data {
    mutating func append(string: String, with encoding: String.Encoding = .utf8) {
        self.append(string.data(using: encoding)!)
    }
    
    mutating func append(boundary: String, trailingDashes: Bool = false) {
        self.append(string: "--" + boundary + (trailingDashes ? "--" : "\r\n"))
    }
    
    mutating func appendContentDisposition(params: [String: String]) {
        let contentDispositionString = "Content-Disposition: form-data; " + (params.map { "\($0.key)=\"\($0.value)\";"}.joined(separator: " "))
        self.append(string: contentDispositionString + "\r\n")
    }
    
    mutating func appendNewline() {
        self.append(string: "\r\n")
    }
}*/


