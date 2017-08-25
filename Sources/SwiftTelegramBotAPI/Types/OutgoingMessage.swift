import Foundation


public struct OutgoingMessage {
    public var chatId: ChatId
    public var text: String
    public var parseMode: ParseMode?
    public var shouldDisableWebPagePreview: Bool = false
    public var shouldDisableNotification: Bool = false
    public var replyToMessageId: Id?
    public var replyMarkup: ReplyMarkup?
}
