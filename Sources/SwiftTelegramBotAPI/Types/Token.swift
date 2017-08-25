import Foundation


public struct Token {
    public let string: String
    
    init?(string: String) {
        guard string != "" else { return nil }
        guard string.rangeOfCharacter(from: CharacterSet.urlPathAllowed.inverted) == nil else {
            return nil
        }
        self.string = string
    }
}
