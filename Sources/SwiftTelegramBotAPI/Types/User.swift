import Foundation


public struct User: Decodable {
    public var id: Id
    public var isBot: Bool
    public var firstName: String
    public var lastName: String?
    public var username: String?
    public var languageCode: String?
}


extension User {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isBot = "is_bot"
        case firstName = "first_name"
        case lastName = "last_name"
        case username = "username"
        case languageCode = "language_code"
    }
}


extension User: CustomStringConvertible {
    public var description: String {
        let botString = isBot ? " (BOT)" : ""
        let languageString = languageCode ?? ""
        return "USER \(id)\(botString) \(languageString): \(firstName) \(lastName ?? "")"
    }
}
