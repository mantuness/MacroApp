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
            input.name,
            input.password,
            input.completion
        )
    }
    
    public init() {
        
    }
}
