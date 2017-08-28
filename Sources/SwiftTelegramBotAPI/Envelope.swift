import Foundation
import Result


public struct Envelope<Content: Decodable>: Decodable {
    public let result: Result<Content, ErrorBox>
    
    public enum CodingKeys: String, CodingKey {
        case ok
        case description
        case result
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let content = try container.decodeIfPresent(Content.self, forKey: .result) {
            result = .success(content)
            return
        }
        if let errorDescription = try container.decodeIfPresent(String.self, forKey: .description) {
            result = .failure(ErrorBox(errorDescription))
            return
        }
        throw JustError("Malformed decoder: can't extract neither result nor error")
    }
}
