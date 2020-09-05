import XCTest
@testable import Domain

extension GetFeatureFlagsUseCase.Input {
    static let mock: ([FeatureFlag: Bool], @escaping (Result<[FeatureFlag : Bool], Error>) -> Void) -> Self = { features, completion in
        .init(
            appRepository: .mock(.mock, features),
            completion: completion
        )
    }
    
    static let failureMock: (Error, @escaping (Result<[FeatureFlag : Bool], Error>) -> Void) -> Self = { error, completion in
        .init(
            appRepository: .failureMock(error),
            completion: completion
        )
    }
}
