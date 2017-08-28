import Foundation


public struct Message: Decodable {
    public var messageId: Id
    
    public enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
    }
    // FIXME: Uncomment other fields
 /*   public var from: User?
    public var date: Date
    public var chat: Chat
    public var forwardFrom: User?
    public var forwardFromChat: Chat?
    public var forwardFromMessageId: Id?
    public var forwardDate: Date?
    public var editDate: Date?
    public var text: String?
    public var entities: [MessageEntity] */
    // TODO: Add other fields
}

