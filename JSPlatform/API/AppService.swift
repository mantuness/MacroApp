import Foundation

public struct AppService {
    public var getConfigs = getConfigs(completion:)
    public var getFeatureFlags = getFeatureFlags(completion:)
    
    public init() {
        
    }
    
    internal init(
        getConfigs: @escaping (@escaping (Result<JSConfigs, Error>) -> Void) -> (),
        getFeatureFlags: @escaping (@escaping (Result<JSFeatureFlags, Error>) -> Void) -> ()) {
        self.getConfigs = getConfigs
        self.getFeatureFlags = getFeatureFlags
    }
}

private func getConfigs(completion: @escaping (Result<JSConfigs, Error>) -> Void) {
    JSClient().invokeMethod("JSDispatcherModule.getConfigs", nil, completion)
}

private func getFeatureFlags(completion: @escaping (Result<JSFeatureFlags, Error>) -> Void) {
    JSClient().invokeMethod("JSDispatcherModule.getFeatureFlags", nil, completion)
}

extension AppService {
    public static var mock = AppService(
        getConfigs: { callback in
            callback(.success(JSConfigs(rottenTomatoesFreshMinimumValue: nil, spsEndpointHost: nil)))
        },
        getFeatureFlags: { callback in
            callback(.success(.init(manhattanPdp: true, trendingHomepage: true, badjorasDoModem: true)))
        }
    )
}
