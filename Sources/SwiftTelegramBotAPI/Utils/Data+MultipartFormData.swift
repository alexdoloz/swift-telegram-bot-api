import Foundation


extension Data {
    enum EncodingError: Error {
        case error(String, String.Encoding)
    }
    
    mutating func append(string: String, with encoding: String.Encoding = .utf8) throws {
        guard let data = string.data(using: encoding) else {
            throw EncodingError.error(string, encoding)
        }
        self.append(data)
    }
    
    mutating func append(boundary: String, trailingDashes: Bool = false) throws {
        let prefix = "--"
        let suffix = trailingDashes ? "--" : "\r\n"
        let finalBoundary = prefix + boundary + suffix
        try self.append(string: finalBoundary)
    }
    
    mutating func appendContentDisposition(params: [String: String]) throws {
        let paramsString = params
            .map { "\($0.key)=\"\($0.value)\";"}
            .joined(separator: " ")
        let contentDispositionString = "Content-Disposition: form-data; " + paramsString
        try self.append(string: contentDispositionString + "\r\n")
    }
    
    mutating func appendNewline() throws {
        try self.append(string: "\r\n")
    }
    
    init(multipartParams: [String: Any], boundary: String) throws {
        self = Data()
        if multipartParams.count == 0 { return }
        for (key, value) in multipartParams {
            try self.append(boundary: boundary)
            var contentDispositionParams = ["name": key]
            if let inputFile = value as? InputFile {
                contentDispositionParams["filename"] = inputFile.fileName
                try self.appendContentDisposition(params: contentDispositionParams)
                try self.append(string: "Content-Type: \(inputFile.mimeType)\r\n")
                try self.appendNewline()
                self.append(inputFile.data)
                try self.appendNewline()
                continue
            }
            try self.appendContentDisposition(params: contentDispositionParams)
            try self.appendNewline()
            let jsonRepresentation = makeJSONLikeRepresentation(from: value)
            try self.append(string: jsonRepresentation)
            try self.appendNewline()
        }
        try self.append(boundary: boundary, trailingDashes: true)
    }
}
