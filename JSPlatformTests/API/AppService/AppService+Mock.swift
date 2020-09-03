import XCTest
@testable import JSPlatform

extension AppService {
    public static var mock = AppService(
        getConfigs: { callback in
            callback(.success(.mock))
        },
        getFeatureFlags: { callback in
            callback(.success(.mock))
        }
    )
    
    public static var failureMock = AppService(
        getConfigs: { callback in
            callback(.failure(NSError.mock))
        },
        getFeatureFlags: { callback in
            callback(.failure(NSError.mock))
        }
    )
}
