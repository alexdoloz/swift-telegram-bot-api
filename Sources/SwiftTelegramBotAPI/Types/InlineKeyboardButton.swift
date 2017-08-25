import Foundation


public struct InlineKeyboardButton {
    public var text: String
    public var option: Option
}


public extension InlineKeyboardButton {
    public enum Option {
        case url(URL)
        case callbackData(String)
        case switchInlineQuery(String)
        case switchInlineQueryCurrentChat(String)
        case callbackGame(CallbackGame)
        case pay
    }
}
