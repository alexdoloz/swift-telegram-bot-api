import Foundation


public class InlineKeyboardMarkup: AbstractKeyboard {
    public var inlineKeyboard: [[InlineKeyboardButton]]
    
    public init(inlineKeyboard: [[InlineKeyboardButton]]) {
        self.inlineKeyboard = inlineKeyboard
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(inlineKeyboard, forKey: .inlineKeyboard)
    }
}


public extension InlineKeyboardMarkup {
    public enum CodingKeys: String, CodingKey {
        case inlineKeyboard = "inline_keyboard"
    }
}
