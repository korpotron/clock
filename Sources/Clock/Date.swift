import Foundation

public extension Date {
    static func + (lhs: Date, rhs: Duration) -> Date {
        lhs + TimeInterval(rhs)
    }
}
