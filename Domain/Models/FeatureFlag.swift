import Foundation

public enum FeatureFlag: Hashable {
    case manhattanPdp
    case trendingHomepage
    case badjorasDoModem
}

extension FeatureFlag {
    public static let mock: [Self: Bool] = [.badjorasDoModem: true, ]
}

extension Dictionary where Key == FeatureFlag, Value == Bool {
    public static let mock = [
        FeatureFlag.manhattanPdp: true,
        .trendingHomepage: true,
        .badjorasDoModem: false
    ]
}
