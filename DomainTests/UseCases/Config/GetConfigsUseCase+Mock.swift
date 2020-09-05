import XCTest
@testable import Domain

extension GetConfigsUseCase.Input {
    static let mock: (Configs, @escaping (Result<Configs, Error>) -> Void) -> Self = { configs, completion in
        .init(
            appRepository: .mock(configs, .mock),
            completion: completion
        )
    }
    
    static let failureMock: (Error, @escaping (Result<Configs, Error>) -> Void) -> Self = { error, completion in
        .init(
            appRepository: .failureMock(error),
            completion: completion
        )
    }
}
