import Foundation

public struct JSConfigs: Codable, Equatable {
    public let rottenTomatoesFreshMinimumValue: String?
    public let spsEndpointHost: String?
    
    public init(rottenTomatoesFreshMinimumValue: String?,
                spsEndpointHost: String?) {
        self.rottenTomatoesFreshMinimumValue = rottenTomatoesFreshMinimumValue
        self.spsEndpointHost = spsEndpointHost
    }
}
