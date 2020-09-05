import XCTest
@testable import Domain

extension DeleteUserUseCase.Input {
    static let mock: (User, @escaping (Result<Void, Error>) -> Void) -> Self = { user, completion in
        .init(
            userRepository: .mock(user),
            id: 0,
            completion: completion
        )
    }
    
    static let failureMock: (Error, @escaping (Result<Void, Error>) -> Void) -> Self = { error, completion in
        .init(
            userRepository: .failureMock(error),
            id: 0,
            completion: completion
        )
    }
}
