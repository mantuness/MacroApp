import Foundation

public struct JSFeatureFlags: Codable {
    public let manhattanPdp: Bool
    public let trendingHomepage: Bool
    public let badjorasDoModem: Bool
    
    public init(manhattanPdp: Bool,
                trendingHomepage: Bool,
                badjorasDoModem: Bool) {
        self.manhattanPdp = manhattanPdp
        self.trendingHomepage = trendingHomepage
        self.badjorasDoModem = badjorasDoModem
    }
}


