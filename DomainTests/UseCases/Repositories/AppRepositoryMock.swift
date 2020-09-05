import Foundation
@testable import Domain

extension AppRepository {
    static let mock: (Configs, [FeatureFlag: Bool]) -> Self = { configs, features in
        .init(
            getConfigs: {
                $0(.success(configs))
                return configs
            },
            getFeatureFlags: {
                $0(.success(features))
                return features
            },
            getValue: {
                $1(.success(false))
                return false
            },
            set: { _,_ in
                
            }
        )
    }
    
    static let failureMock: (Error) -> Self = { error in
        .init(
            getConfigs: {
                $0(.failure(error))
                return nil
            },
            getFeatureFlags: {
                $0(.failure(error))
                return nil
            },
            getValue: {
                $1(.failure(error))
                return nil
            },
            set: { _,_ in
                
            }
        )
    }
}

