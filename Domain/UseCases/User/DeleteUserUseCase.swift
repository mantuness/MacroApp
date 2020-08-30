import Foundation

public final class DeleteUserUseCase: UseCase {
    public struct Input {
        public let id: Int
        public let completion: (Result<Void, Error>) -> Void
    }
    private let userRepository: UserRepository
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func execute(input: Input) -> Void {
        return userRepository.delete(id: input.id, completion: input.completion)
    }
}
