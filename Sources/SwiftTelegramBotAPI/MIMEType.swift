import Foundation


public struct MIMEType {
    public let string: String
    
    init(string: String) {
        self.string = string
    }
}


extension MIMEType: CustomStringConvertible {
    public var description: String {
        return string
    }
}
