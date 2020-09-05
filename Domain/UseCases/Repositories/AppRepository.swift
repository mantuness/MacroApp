import Foundation

public struct AppRepository {
    var getConfigs: (_ completion: @escaping (Result<Configs, Error>) -> Void) -> Configs?
    var getFeatureFlags: (_ completion: @escaping (Result<[FeatureFlag: Bool], Error>) -> Void) -> [FeatureFlag: Bool]?
    var getValue: (_ ff: FeatureFlag, _ completion: @escaping (Result<Bool, Error>) -> Void) -> Bool?
    var set: (_ value: Bool, _ for: FeatureFlag) -> Void
    
    public init(
        getConfigs: @escaping (_ completion: @escaping (Result<Configs, Error>) -> Void) -> Configs?,
        getFeatureFlags: @escaping (_ completion: @escaping (Result<[FeatureFlag: Bool], Error>) -> Void) -> [FeatureFlag: Bool]?,
        getValue: @escaping (_ ff: FeatureFlag, _ completion: @escaping (Result<Bool, Error>) -> Void) -> Bool?,
        set: @escaping (_ value: Bool, _ for: FeatureFlag) -> Void
    ) {
        self.getConfigs = getConfigs
        self.getFeatureFlags = getFeatureFlags
        self.getValue = getValue
        self.set = set
    }
}
