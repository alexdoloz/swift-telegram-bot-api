import Foundation


public struct Token {
    public let string: String
    
    init?(string: String) {
        guard string != "" else { return nil }
        self.string = string
    }
}
