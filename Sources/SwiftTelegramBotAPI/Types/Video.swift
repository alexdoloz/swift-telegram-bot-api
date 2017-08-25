import Foundation


public struct Video {
    public var fileId: FileId
    public var width: Int
    public var height: Int
    public var duration: Int
    public var thumb: PhotoSize?
    public var fileName: String?
    public var mimeType: MIMEType?
    public var fileSize: Int?
}

