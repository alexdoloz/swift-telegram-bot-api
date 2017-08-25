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
