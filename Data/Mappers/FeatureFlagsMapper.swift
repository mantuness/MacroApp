import Foundation
import Domain
import JSPlatform

extension JSPlatform.JSFeatureFlags: DomainConvertibleType {
    func asDomain() throws -> [FeatureFlag: Bool] {
        return [.badjorasDoModem: badjorasDoModem,
                .manhattanPdp: manhattanPdp,
                .trendingHomepage: trendingHomepage]
    }
}
