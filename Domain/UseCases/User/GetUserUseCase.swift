import Foundation

public final class GetUserUseCase: UseCase {
    public struct Input {
        public let id: Int
        public let completion: (Result<User, Error>) -> Void
    }
    private let userRepository: UserRepository
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func execute(input: Input) -> Void {
        return userRepository.getUser(id: input.id, completion: input.completion)
    }
}
