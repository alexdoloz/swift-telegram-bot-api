import Foundation


public struct Chat {
    public var id: Id
    public var type: ChatType
    public var title: String?
    public var username: String?
    public var firstName: String?
    public var lastName: String?
    public var areAllMembersAdministrators: Bool = false
    public var photo: ChatPhoto?
    public var chatDescription: String?
    public var inviteLink: URL?
    public var pinnedMessage: Box<Message>?
}


public extension Chat {
public enum ChatType: String {
    case privateChat
    case group
    case superGroup
    case channel
}
}

