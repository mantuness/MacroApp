import Foundation

public final class CreateUserUseCase: UseCase {
    public struct Input {
        public let name: String
        public let password: String
        public let completion: (Result<User, Error>) -> Void
    }
    
    private let userRepository: UserRepository
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func execute(input: Input) {
        userRepository.createUser(name: input.name,
                                  password: input.password,
                                  completion: input.completion)
    }
}
