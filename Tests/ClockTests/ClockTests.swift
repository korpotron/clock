import Clock
import XCTest

final class ClockTests: XCTestCase {
    func test_of() {
        let sut = Clock.of { .parse("2001-02-03T04:05:06Z") }
        XCTAssertEqual(sut.now.timeIntervalSince1970, 981_173_106)
    }

    func test_system() {
        let sut = Clock.system
        XCTAssertEqual(sut.now.timeIntervalSince1970, Date.now.timeIntervalSince1970, accuracy: 0.1)
    }
}

private extension Date {
    static func parse(_ string: String) -> Self {
        try! Date(string, strategy: .iso8601)
    }
}
