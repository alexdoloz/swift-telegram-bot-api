import Foundation
import Result


public struct ResponseParameters {
    public var migrateToChatId: Int64?
    public var retryAfter: Int?
    
    init(migrateToChatId: Int64? = nil, retryAfter: Int? = nil) {
        self.migrateToChatId = migrateToChatId
        self.retryAfter = retryAfter
    }
}

public struct TelegramError: Error {
    public private(set) var errorDescription: String?
    public private(set) var parameters: ResponseParameters?
    
    init(errorDescription: String? = nil, parameters: ResponseParameters? = nil) {
        self.errorDescription = errorDescription
        self.parameters = parameters
    }
}


public protocol RequestSender {
    func send(request: URLRequest, completion: @escaping (Result<Data, TelegramError>) -> Void)
}

public protocol WebhookProvider {
    var onUpdatesReceived: (Void) -> Void { get set }
}

public enum UpdateMode {
    case polling(interval: TimeInterval)
    case webhook(provider: WebhookProvider)
}


public final class TelegramBot {
    private let requestSender: RequestSender
    private let updateMode: UpdateMode
    
    public init(requestSender: RequestSender, updateMode: UpdateMode = .polling(interval: 1.0)) {
        self.requestSender = requestSender
        self.updateMode = updateMode
    }
}
