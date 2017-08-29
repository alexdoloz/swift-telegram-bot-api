import Foundation


public struct KeyboardButton: Encodable {
    public var text: String
    public var option: Option?
    
    public init(text: String, option: Option? = nil) {
        self.text = text
        self.option = option
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        if let option = option {
            switch option {
            case .contact: try container.encode(true, forKey: .requestContact)
            case .location: try container.encode(true, forKey: .requestLocation)
            }
        }
    }
}


public extension KeyboardButton {
    public enum Option {
        case contact
        case location
    }
}


public extension KeyboardButton {
    public enum CodingKeys: String, CodingKey {
        case text
        case requestContact = "request_contact"
        case requestLocation = "request_location"
    }
}
