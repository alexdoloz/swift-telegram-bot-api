import Foundation


public final class Box<Value> {
    public var value: Value
    
    public init(_ value: Value) {
        self.value = value
    }
}
