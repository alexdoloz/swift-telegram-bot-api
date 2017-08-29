import Foundation


public class ReplyKeyboardMarkup: AbstractKeyboard {
    public var keyboard: [[KeyboardButton]]
    public var shouldResizeKeyboard: Bool = false
    public var isOneTimeKeyboard: Bool = false
    public var isSelective: Bool = false
    
    public init(keyboard: [[KeyboardButton]], shouldResizeKeyboard: Bool = false, isOneTimeKeyboard: Bool = false, isSelective: Bool = false) {
        self.keyboard = keyboard
        self.shouldResizeKeyboard = shouldResizeKeyboard
        self.isOneTimeKeyboard = isOneTimeKeyboard
        self.isSelective = isSelective
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(keyboard, forKey: .keyboard)
        try container.encode(shouldResizeKeyboard, forKey: .shouldResizeKeyboard)
        try container.encode(isOneTimeKeyboard, forKey: .isOneTimeKeyboard)
        try container.encode(isSelective, forKey: .isSelective)
    }
}


public extension ReplyKeyboardMarkup {
    public enum CodingKeys: String, CodingKey {
        case keyboard
        case shouldResizeKeyboard = "resize_keyboard"
        case isOneTimeKeyboard = "one_time_keyboard"
        case isSelective = "selective"
    }
}
