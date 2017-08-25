import Foundation


public struct Audio {
    public var fileId: FileId
    public var duration: Int
    public var performer: String?
    public var title: String?
    public var mimeType: MIMEType?
    public var fileSize: Int?
}
