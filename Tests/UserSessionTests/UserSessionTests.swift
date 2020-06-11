import XCTest
@testable import UserSession

final class UserSessionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UserSession().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
