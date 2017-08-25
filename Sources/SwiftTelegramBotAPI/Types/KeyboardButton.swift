import Foundation


public struct KeyboardButton {
    public var text: String
    public var option: Option?
}


public extension KeyboardButton {
    public enum Option {
        case contact
        case location
    }
}
