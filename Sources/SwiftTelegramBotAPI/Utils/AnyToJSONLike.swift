import Foundation

/** Transforms like this:
 For primitive types (number, string) returns their string value
 For dicts and arrays returns their JSON representation
 Otherwise, returns string value */
func makeJSONLikeRepresentation(from any: Any) -> String {
    if any is [String: Any] || any is [Any] {
        guard
            let jsonData = (try? JSONSerialization.data(withJSONObject: any)),
            let jsonString = String(data: jsonData, encoding: .utf8)
        else {
            return "\(any)"
        }
        return jsonString
    }
    return "\(any)"
}
