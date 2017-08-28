import Foundation


public struct ErrorBox: Error, CustomStringConvertible {
    public let innerError: Error
    
    public init(_ innerError: Error) {
        self.innerError = innerError
    }
    
    public init(_ errorDescription: String) {
        self.innerError = JustError(errorDescription)
    }
    
    public var description: String {
        return "\(innerError)"
    }
}
