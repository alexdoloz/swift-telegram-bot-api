import Foundation


public enum ChatId: Encodable {
    case chat(Id)
    case username(String)
    
    public func encode(to encoder: Encoder) throws {
        var leaf = encoder.singleValueContainer()
        switch self {
        case .chat(let id): try leaf.encode(id)
        case .username(let username): try leaf.encode("@\(username)")
        }
    }
}
