import Foundation


public struct Methods {
    public static let getMe = Method<Nothing, User>(name: "getMe")
    public static let sendMessage = Method<OutgoingMessage, Message>(name: "sendMessage")
}
