import XCTest
@testable import Domain

extension GetUserUseCase.Input {
    static let mock: (User, @escaping (Result<User, Error>) -> Void) -> Self = { user, completion in
        .init(
            userRepository: .mock(user),
            id: 0,
            completion: completion
        )
    }
    
    static let failureMock: (Error, @escaping (Result<User, Error>) -> Void) -> Self = { error, completion in
        .init(
            userRepository: .failureMock(error),
            id: 0,
            completion: completion
        )
    }
}
