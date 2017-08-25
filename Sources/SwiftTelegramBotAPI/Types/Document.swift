import Foundation


public struct Document {
    public var fileId: FileId
    public var thumb: PhotoSize?
    public var fileName: String?
    public var mimeType: MIMEType?
    public var fileSize: Int?
}
