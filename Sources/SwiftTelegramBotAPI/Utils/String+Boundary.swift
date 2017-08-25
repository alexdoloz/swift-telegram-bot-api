import Foundation


extension String {
    static func createBoundary() -> String {
        return "boundary" + UUID().uuidString
    }
}
