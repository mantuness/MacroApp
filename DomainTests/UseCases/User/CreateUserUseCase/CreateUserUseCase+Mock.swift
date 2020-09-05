import XCTest
@testable import Domain

extension CreateUserUseCase.Input {
    static let mock: (User, @escaping (Result<User, Error>) -> Void) -> Self = { user, completion in
        .init(
            userRepository: .mock(user),
            name: "Mock",
            password: "mock",
            completion: completion
        )
    }
    
    static let failureMock: (Error, @escaping (Result<User, Error>) -> Void) -> Self = { error, completion in
        .init(
            userRepository: .failureMock(error),
            name: "Mock",
            password: "mock",
            completion: completion
        )
    }
}
