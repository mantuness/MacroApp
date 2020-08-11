import Foundation
import Domain
import JSPlatform

public final class AppRepositoryImpl: Domain.AppRepository {
    private let appService: JSPlatform.AppService
    public init(appService: JSPlatform.AppService) {
        self.appService = appService
    }
    
    public func getConfigs(completion: @escaping (Result<Configs, Error>) -> Void) -> Configs? {
        appService.getConfigs { result in
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
    
    public func getFeatureFlags(completion: @escaping (Result<[FeatureFlag : Bool], Error>) -> Void) -> [FeatureFlag : Bool]? {
        appService.getFeatureFlags { result in
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
    
    public func getValue(for ff: FeatureFlag, completion: @escaping (Result<Bool, Error>) -> Void) -> Bool? {
        return nil // TODO: Use FileService to check if exists locally and return. Otherwise use AppService to get featureFlags, store it locally with FileService and return the correspondent value
    }
    
    public func set(value: Bool, for ff: FeatureFlag) {
        // TODO: Use FileService to set the new value locally
    }
}
