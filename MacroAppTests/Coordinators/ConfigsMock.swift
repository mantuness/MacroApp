import Domain
import XCTest
@testable import MacroApp

// This could be shared by the DomainTests

extension Configs {
    static let mock: Self = .init(
        rottenTomatoesFreshMinimumValue: 0,
        spsEndpointHost: URL(string: "http://www.google.com")!
    )
}
