import Foundation

public protocol AppRepository {
    func getConfigs(completion: @escaping (Result<Configs, Error>) -> Void) -> Configs?
    func getFeatureFlags(completion: @escaping (Result<[FeatureFlag: Bool], Error>) -> Void) -> [FeatureFlag: Bool]?
    func getValue(for ff: FeatureFlag, completion: @escaping (Result<Bool, Error>) -> Void) -> Bool?
    func set(value: Bool, for ff: FeatureFlag)
}
