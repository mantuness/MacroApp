import Foundation

public protocol AppService {
    func getConfigs(completion: @escaping (Result<JSConfigs, Error>) -> Void)
    func getFeatureFlags(completion: @escaping (Result<JSFeatureFlags, Error>) -> Void)
}

public final class JSAppService: AppService {
    private let client: JSClient
    init(client: JSClient) {
        self.client = client
    }
    
    public func getConfigs(completion: @escaping (Result<JSConfigs, Error>) -> Void) {
        let successClosure: (JSConfigs) -> Void = { config in
            completion(Result.success(config))
        }
        
        let failureClosure: (Error) -> Void = { error in
            completion(Result.failure(error))
        }
        client.invokeMethod(named: "GET.CONFIGS", parameters: nil, success: successClosure, failure: failureClosure)
    }
    
    public func getFeatureFlags(completion: @escaping (Result<JSFeatureFlags, Error>) -> Void) {
        let successClosure: (JSFeatureFlags) -> Void = { config in
            completion(Result.success(config))
        }
        
        let failureClosure: (Error) -> Void = { error in
            completion(Result.failure(error))
        }
        client.invokeMethod(named: "GET.FEATUREFLAGS", parameters: nil, success: successClosure, failure: failureClosure)
    }
}
