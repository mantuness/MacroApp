import Foundation
import Domain
import JSPlatform

public struct AppRepository {    
    public var getConfigs = getConfigs(jsAppService:)
    public var getFeatureFlags = getFeatureFlags(jsAppService:)
    public var getValue = getValue(jsAppService:)
    public var set = set(jsAppService:)
    
    public init() { }
}

private func getConfigs(jsAppService: JSPlatform.AppService)
    -> (@escaping (Result<Configs, Error>) -> Void)
    -> Configs? {
        { completion in
            jsAppService.getConfigs { result in
                do {
                    let domainValue = try result.get().asDomain()
                    completion(Result.success(domainValue))
                }
                catch let error {
                    completion(Result.failure(error))
                }
            }
            return nil // TODO: Use FileService to check if exists locally and return
        }
}

private func getFeatureFlags(jsAppService: JSPlatform.AppService)
    -> (_ completion: @escaping (Result<[FeatureFlag : Bool], Error>) -> Void)
    -> [FeatureFlag : Bool]? {
        { completion in
            jsAppService.getFeatureFlags { result in
                do {
                    let domainValue = try result.get().asDomain()
                    completion(Result.success(domainValue))
                }
                catch let error {
                    completion(Result.failure(error))
                }
            }
            return nil // TODO: Use FileService to check if exists locally and return
        }
}

private func getValue(jsAppService: JSPlatform.AppService)
    -> (_ ff: FeatureFlag, _ completion: @escaping (Result<Bool, Error>) -> Void)
    -> Bool? {
        { _, _ in
            return nil // TODO: Use FileService to check if exists locally and return. Otherwise use AppService to get featureFlags, store it locally with FileService and return the correspondent value
        }
}

private func set(jsAppService: JSPlatform.AppService)
    -> (_ value: Bool, _ ff: FeatureFlag)
    -> Void {
        { _, _ in
            // TODO: Use FileService to set the new value locally
        }
}
