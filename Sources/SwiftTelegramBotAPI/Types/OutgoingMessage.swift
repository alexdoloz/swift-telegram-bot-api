import Foundation


public struct OutgoingMessage: Encodable {
    public var chatId: ChatId
    public var text: String
    public var parseMode: ParseMode?
    public var shouldDisableWebPagePreview: Bool = false
    public var shouldDisableNotification: Bool = false
    public var replyToMessageId: Id?
    public var replyMarkup: AbstractKeyboard?
    
    public init(
        chatId: ChatId,
        text: String,
        parseMode: ParseMode? = nil,
        shouldDisableWebPagePreview: Bool = false,
        shouldDisableNotification: Bool = false,
        replyToMessageId: Id? = nil,
        replyMarkup: AbstractKeyboard? = nil
    ) {
        self.chatId = chatId
        self.text = text
        self.parseMode = parseMode
        self.shouldDisableWebPagePreview = shouldDisableWebPagePreview
        self.shouldDisableNotification = shouldDisableNotification
        self.replyToMessageId = replyToMessageId
        self.replyMarkup = replyMarkup
    }
    // FIXME: Temporarily disable this field until all keyboards be Encodable
    public enum CodingKeys: String, CodingKey {
        case chatId = "chat_id"
        case text
        case parseMode = "parse_mode"
        case shouldDisableWebPagePreview = "disable_web_page_preview"
        case shouldDisableNotification = "disable_notification"
        case replyToMessageId = "reply_to_message_id"
        case replyMarkup = "reply_markup"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(chatId, forKey: .chatId)
        try container.encode(text, forKey: .text)
        try container.encodeIfPresent(parseMode, forKey: .parseMode)
        try container.encode(shouldDisableWebPagePreview, forKey: .shouldDisableWebPagePreview)
        try container.encode(shouldDisableNotification, forKey: .shouldDisableNotification)
        try container.encodeIfPresent(replyToMessageId, forKey: .replyToMessageId)
        try container.encodeIfPresent(replyMarkup, forKey: .replyMarkup)
    }
}


