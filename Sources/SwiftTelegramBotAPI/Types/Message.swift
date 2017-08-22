import Foundation


public struct Chat {
    
}

public struct MessageEntity {
    
}

public struct Message {
    public var messageId: Int64
    public var from: User?
    public var date: Date
    public var chat: Chat
    public var forwardFrom: User?
    public var forwardFromChat: Chat?
    public var forwardFromMessageId: Int64?
    public var forwardDate: Date?
    public var editDate: Date?
    public var text: String?
    public var entities: [MessageEntity]
    // TODO: Add other fields
}
