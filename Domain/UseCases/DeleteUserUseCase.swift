import Foundation

public protocol DeleteUserUseCase: Domain.UseCase {}
public final class DeleteUserUseCaseImpl: DeleteUserUseCase {
    private let userRepository: UserRepository
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func execute(input: Int) -> Void {
        return userRepository.delete(id: input)
    }
}
