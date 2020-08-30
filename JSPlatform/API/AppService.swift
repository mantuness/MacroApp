import Foundation

public protocol AppService {
    func getConfigs(completion: @escaping (Result<JSConfigs, Error>) -> Void)
    func getFeatureFlags(completion: @escaping (Result<JSFeatureFlags, Error>) -> Void)
}

public final class JSAppService: AppService {
    private let client: JSClient
    public init(client: JSClient) {
        self.client = client
    }
    
    public func getConfigs(completion: @escaping (Result<JSConfigs, Error>) -> Void) {
        client.invokeMethod(named: "JSDispatcherModule.getConfigs", parameters: nil, completion: completion)
    }
    
    public func getFeatureFlags(completion: @escaping (Result<JSFeatureFlags, Error>) -> Void) {
        client.invokeMethod(named: "JSDispatcherModule.getFeatureFlags", parameters: nil, completion: completion)
    }
}
