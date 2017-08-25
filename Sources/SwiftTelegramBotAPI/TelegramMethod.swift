import Foundation


public enum TelegramMethod: String {
    case getMe
    case sendPhoto
    case sendMessage
    
    var string: String {
        return rawValue
    }
}
