import Foundation

public protocol CreateUserUseCase: UseCase {}
public final class CreateUserUseCaseImpl: CreateUserUseCase {
    public struct Input {
        let name: String
        let password: String
        let completion: (Result<User, Error>) -> Void
    }
    
    private let userRepository: UserRepository
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func execute(input: Input) -> Void {
        return userRepository.createUser(name: input.name,
                                         password: input.password,
                                         completion: input.completion)
    }
}
