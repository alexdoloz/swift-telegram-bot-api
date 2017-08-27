import Foundation
import Result


public struct Method<Input: Encodable, Output: Decodable> {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}


public struct JustError: Error, CustomStringConvertible, CustomDebugStringConvertible {
    private let _description: String
    init(_ description: String) {
        _description = description
    }
    
    public var description: String { return _description }
    public var debugDescription: String { return _description }
}

public final class MethodExecutor {
    private let requestComposer: RequestComposer
    private let requestSender: RequestSender
    private let completionQueue: DispatchQueue
    
    public init(token: Token, requestSender: RequestSender, completionQueue: DispatchQueue = .main) {
        self.requestComposer = TelegramRequestComposer(token: token)
        self.requestSender = requestSender
        self.completionQueue = completionQueue
    }
    
    private func dictionary<Input: Encodable>(from input: Input) throws -> [String: Any] {
        // FIXME: Inefficient way: Input -> Data -> [String: Any]
        // Should make custom `Encoder` to do Input -> [String: Any]
        let jsonEncoder = JSONEncoder()
        let data = try jsonEncoder.encode(input)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let dictionary = object as? [String: Any] else {
            throw JustError("""
            Object of type \(Input.self) can't be mapped to [String: Any]
            \(input)
            """)
        }
        return dictionary
    }
    
    public func execute<Input, Output>(method: Method<Input, Output>, params: Input, completion: @escaping (Result<Output, ErrorContainer>) -> Void) {
        do {
            let paramsDictionary = try dictionary(from: params)
            let request = try requestComposer.composeRequest(method: method.name,  passing: .multipartFormData, params: paramsDictionary)
            requestSender.send(request: request) { [unowned self](result) in
                var finalResult: Result<Output, ErrorContainer>
                defer {
                    self.completionQueue.async {
                        completion(finalResult)
                    }
                }
                switch result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    do {
                        let output = try jsonDecoder.decode(Output.self, from: data)
                        finalResult = .success(output)
                    } catch {
                        finalResult = .failure(ErrorContainer(error))
                    }
                case .failure(let error):
                    finalResult = .failure(ErrorContainer(error))
                }
            }
        } catch {
            completionQueue.async {
                completion(.failure(ErrorContainer(error)))
            }
        }
        
    }
}
