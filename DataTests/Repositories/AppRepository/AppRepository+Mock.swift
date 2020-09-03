import XCTest
import JSPlatform
@testable import Data

extension AppRepository {
    static let mock: (AppService) -> Self = { .init(jsAppService: $0) }
}

extension JSConfigs {
    static let mock: Self = .init(
        rottenTomatoesFreshMinimumValue: "30",
        spsEndpointHost: "https://www.sps.com"
    )
}

extension JSFeatureFlags {
    static let mock: Self = .init(
        manhattanPdp: true,
        trendingHomepage: false,
        badjorasDoModem: true
    )
}
