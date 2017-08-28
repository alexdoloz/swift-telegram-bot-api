import Foundation


public struct InlineKeyboardButton: Encodable {
    public var text: String
    public var option: Option
    
    public init(text: String, option: Option) {
        self.text = text
        self.option = option
    }
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


public extension InlineKeyboardButton {
    public enum CodingKeys: String, CodingKey {
        case text
        case url
        case callbackData = "callback_data"
        case switchInlineQuery = "switch_inline_query"
        case switchInlineQueryCurrentChat = "switch_inline_query_current_chat"
        case callbackGame = "callback_game"
        case pay
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        switch option {
        case .url(let url): try container.encode(url.absoluteString, forKey: .url)
        case .callbackData(let string): try container.encode(string, forKey: .callbackData)
        case .switchInlineQuery(let string): try container.encode(string, forKey: .switchInlineQuery)
        case .switchInlineQueryCurrentChat(let string): try container.encode(string, forKey: .switchInlineQueryCurrentChat)
        case .callbackGame(let callbackGame): try container.encode(callbackGame, forKey: .callbackGame)
        case .pay: try container.encode(true, forKey: .pay)
        }
    }
}
