import Foundation

public struct CreateUserUseCase: UseCase {
    public struct Input {
        public let userRepository: UserRepository
        public let name: String
        public let password: String
        public let completion: (Result<User, Error>) -> Void
    }
    
    public var execute: (Input) -> Void = { input in
        input.userRepository.createUser(
            name: input.name,
            password: input.password,
            completion: input.completion
        )
    }
    
    public init() {
        
    }
    
    internal init(execute: @escaping (Input) -> Void) {
        self.execute = execute
    }
}

extension CreateUserUseCase {
    public static let mock: Self = .init { (input) in
        input.completion(.success(.init(id: 0, name: input.name)))
    }
}
