import Foundation


public struct ReplyKeyboardMarkup: ReplyMarkup {
    public var keyboard: [[KeyboardButton]]
    public var shouldResizeKeyboard: Bool = false
    public var isOneTimeKeyboard: Bool = false
    public var isSelective: Bool = false
}
