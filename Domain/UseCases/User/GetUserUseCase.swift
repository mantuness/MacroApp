import Foundation

public struct GetUserUseCase: UseCase {
    public struct Input {
        public let userRepository: UserRepository
        public let id: Int
        public let completion: (Result<User, Error>) -> Void
    }

    public var execute: (Input) -> Void = { input in
        input.userRepository.getUser(id: input.id, completion: input.completion)
    }
    
    public init() {
        
    }
    
    internal init(execute: @escaping (Input) -> Void) {
        self.execute = execute
    }
}

extension GetUserUseCase {
    public static let mock: Self = .init { (input) in
        input.completion(.success(.init(id: input.id, name: "user name")))
    }
}
