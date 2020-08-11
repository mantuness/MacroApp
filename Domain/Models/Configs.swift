import Foundation

public struct Configs: Hashable {
    public let rottenTomatoesFreshMinimumValue: Int
    public let spsEndpointHost: URL
    
    public init(rottenTomatoesFreshMinimumValue: Int,
                spsEndpointHost: URL) {
        self.rottenTomatoesFreshMinimumValue = rottenTomatoesFreshMinimumValue
        self.spsEndpointHost = spsEndpointHost
    }
}

