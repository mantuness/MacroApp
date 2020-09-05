import Foundation

public struct DeleteUserUseCase: UseCase {
    public struct Input {
        public let userRepository: UserRepository
        public let id: Int
        public let completion: (Result<Void, Error>) -> Void
    }
    
    public var execute: (Input) -> Void = { input in
        return input.userRepository.delete(input.id, input.completion)
    }
    
    public init() {
        
    }
    
    internal init(execute: @escaping (Input) -> Void) {
        self.execute = execute
    }
}

extension DeleteUserUseCase {
    public static let mock: Self = .init { (input) in
        input.completion(.success(()))
    }
}
