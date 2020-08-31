import Foundation
import Domain
import JSPlatform

// Can we improve this by having the jsAppService setup in an environment?
public struct AppRepository {
    public var jsAppService: JSPlatform.AppService
    
    public var getConfigs = getConfigs(jsAppService:completion:)
    public var getFeatureFlags = getFeatureFlags(jsAppService:completion:)
    public var getValue = getValue(jsAppService:for:completion:)
    public var set = set(jsAppService:value:for:)
    
    public init(jsAppService: JSPlatform.AppService) {
        self.jsAppService = jsAppService
    }
}

extension AppRepository: Domain.AppRepository {
    public func getConfigs(completion: @escaping (Result<Configs, Error>) -> Void) -> Configs? {
        getConfigs(jsAppService, completion)
    }
    
    public func getFeatureFlags(completion: @escaping (Result<[FeatureFlag : Bool], Error>) -> Void) -> [FeatureFlag : Bool]? {
        getFeatureFlags(jsAppService, completion)
    }
    
    public func getValue(for ff: FeatureFlag, completion: @escaping (Result<Bool, Error>) -> Void) -> Bool? {
        getValue(jsAppService, ff, completion)
    }
    
    public func set(value: Bool, for ff: FeatureFlag) {
        set(jsAppService, value, ff)
    }
}

extension AppRepository {
    public static var mock: AppRepository = .init(
        jsAppService: .mock
    )
}

private func getConfigs(jsAppService: JSPlatform.AppService, completion: @escaping (Result<Configs, Error>) -> Void) -> Configs? {
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

private func getFeatureFlags(jsAppService: JSPlatform.AppService, completion: @escaping (Result<[FeatureFlag : Bool], Error>) -> Void) -> [FeatureFlag : Bool]? {
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

private func getValue(jsAppService: JSPlatform.AppService, for ff: FeatureFlag, completion: @escaping (Result<Bool, Error>) -> Void) -> Bool? {
    return nil // TODO: Use FileService to check if exists locally and return. Otherwise use AppService to get featureFlags, store it locally with FileService and return the correspondent value
}

private func set(jsAppService: JSPlatform.AppService, value: Bool, for ff: FeatureFlag) {
    // TODO: Use FileService to set the new value locally
}
