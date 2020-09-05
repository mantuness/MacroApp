import Foundation
@testable import Domain

extension Configs {
    static let mock: Self = .init(
        rottenTomatoesFreshMinimumValue: 0,
        spsEndpointHost: URL(string: "http:/www.google.com")!
    )
}
