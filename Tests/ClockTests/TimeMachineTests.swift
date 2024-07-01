import Clock
import TimeMachine
import XCTest

final class TimeMachineTests: XCTestCase {
    func test_initial() {
        let (sut, _) = Clock.travel(.at_2001_02_03__04_05_06)
        XCTAssertEqual(sut.now.timeIntervalSince1970, 981_173_106)
    }

    func test_jump() {
        let (sut, machine) = Clock.travel(.at_2001_02_03__04_05_06)
        machine.jump(to: .at_2006_05_04__03_02_01)
        XCTAssertEqual(sut.now.timeIntervalSince1970, 1_146_711_721)
    }

    func test_advanced() {
        let (sut, machine) = Clock.travel(.at_2001_02_03__04_05_06)
        machine.advanced(hours: 2, minutes: 4, seconds: 6)
        XCTAssertEqual(sut.now, .at_2001_02_03__06_09_12)
    }
}

private extension Date {
    static func parse(_ string: String) -> Self {
        try! Date(string, strategy: .iso8601)
    }

    static let at_2001_02_03__04_05_06 = Self.parse("2001-02-03T04:05:06Z")
    static let at_2001_02_03__06_09_12 = Self.parse("2001-02-03T06:09:12Z")
    static let at_2006_05_04__03_02_01 = Self.parse("2006-05-04T03:02:01Z")
}
