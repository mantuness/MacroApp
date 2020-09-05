import Foundation
@testable import Domain

extension Dictionary where Key == FeatureFlag, Value == Bool {
    public static let mock = [
        FeatureFlag.manhattanPdp: true,
        .trendingHomepage: true,
        .badjorasDoModem: false
    ]
}
