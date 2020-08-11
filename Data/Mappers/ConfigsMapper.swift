import Foundation
import Domain
import JSPlatform

extension Domain.Configs: JSRepresentable {
    func asJS() -> JSPlatform.JSConfigs {
        JSConfigs(rottenTomatoesFreshMinimumValue: String(rottenTomatoesFreshMinimumValue),
                  spsEndpointHost: spsEndpointHost.absoluteString)
    }
}

extension JSPlatform.JSConfigs: DomainConvertibleType {
    func asDomain() throws -> Domain.Configs {
        guard let rottenMinimumValue = rottenTomatoesFreshMinimumValue,
            let value = Int(rottenMinimumValue),
            let spsEndpoint = spsEndpointHost,
            let url = URL(string: spsEndpoint)else {
                throw NSError(domain: "Failed to map object", code: -99, userInfo: nil)
        }
        return Domain.Configs(rottenTomatoesFreshMinimumValue: value,
                              spsEndpointHost: url)
    }
}
