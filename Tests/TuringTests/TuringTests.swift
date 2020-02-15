import XCTest

@testable import TuringAnyRecursive

final class TuringTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(AnyRecursive.null, AnyRecursive.null)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
