import Foundation

public struct GetUserUseCase: UseCase {
    public struct Input {
        public let userRepository: UserRepository
        public let id: Int
        public let completion: (Result<User, Error>) -> Void
    }

    public var execute: (Input) -> Void = { input in
        input.userRepository.getUser(input.id, input.completion)
    }
    
    public init() {
        
    }
}
