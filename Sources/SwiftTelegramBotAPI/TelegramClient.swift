import Foundation


public final class TelegramClient {
    public let httpClient: HTTPClient
    public let token: Token
    
    
    init(httpClient: HTTPClient, token: Token) {
        self.httpClient = httpClient
        self.token = token
    }
    
    
}
