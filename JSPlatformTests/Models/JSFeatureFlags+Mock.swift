import Foundation
@testable import JSPlatform

extension JSFeatureFlags {
    static let mock = JSFeatureFlags(
        manhattanPdp: true,
        trendingHomepage: true,
        badjorasDoModem: true
    )
}
