import XCTest
@testable import SwiftTelegramBotAPI


class TelegramRequestComposerTests: XCTestCase {
    
    
    var requestComposer: TelegramRequestComposer!
    
    override func setUp() {
        let fakeToken = Token(string: "thisisfaketoken")!
        requestComposer = TelegramRequestComposer(token: fakeToken)
    }
    
    func testRequestBody() {
//        let request = try! requestComposer.composeRequest(method: .sendPhoto, params: [
//            "caption": "This is test caption",
//            "chat_id": "379751776",
//        ])
        let request = try! requestComposer.composeRequest(method: .sendMessage, params: [
            "chat_id": "379751776",
            "text": "Hello!"
        ])
        print(String(data: request.httpBody!, encoding: .utf8)!)
    }
    
    static var allTests = [
        ("testRequestBody", testRequestBody)
    ]
}

