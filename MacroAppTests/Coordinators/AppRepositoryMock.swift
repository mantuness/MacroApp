import Domain
import XCTest
@testable import MacroApp

// This could be shared by the DomainTests

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
}
