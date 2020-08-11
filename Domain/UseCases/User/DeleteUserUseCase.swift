import Foundation

public final class DeleteUserUseCase: UseCase {
    private let userRepository: UserRepository
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func execute(input: Int) -> Void {
        return userRepository.delete(id: input)
    }
}
