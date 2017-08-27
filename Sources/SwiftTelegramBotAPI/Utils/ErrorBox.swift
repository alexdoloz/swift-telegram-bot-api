import Foundation


public struct ErrorBox: Error, CustomStringConvertible {
    public let innerError: Error
    
    public init(_ innerError: Error) {
        self.innerError = innerError
    }
    
    public var description: String {
        return "\(innerError)"
    }
}
