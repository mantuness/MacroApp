import Foundation

public struct JSConfigs: Codable {
    public let rottenTomatoesFreshMinimumValue: String?
    public let spsEndpointHost: String?
    
    public init(rottenTomatoesFreshMinimumValue: String?,
                spsEndpointHost: String?) {
        self.rottenTomatoesFreshMinimumValue = rottenTomatoesFreshMinimumValue
        self.spsEndpointHost = spsEndpointHost
    }
}
