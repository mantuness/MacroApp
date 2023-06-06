import Foundation
import Domain
import Swinject

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetUserUseCase.self) { r in
            return GetUserUseCase(
                userRepository: r.resolve(UserRepository.self)!
            )
        }
        container.register(CreateUserUseCase.self) { r in
            return CreateUserUseCase(
                userRepository: r.resolve(UserRepository.self)!
            )
        }
        container.register(DeleteUserUseCase.self) { r in
            return DeleteUserUseCase(
                userRepository: r.resolve(UserRepository.self)!
            )
        }
        container.register(ValidateUserIdUseCase.self) { r in
            return ValidateUserIdUseCase()
        }
        container.register(GetConfigsUseCase.self) { r in
            return GetConfigsUseCase(
                appRepository: r.resolve(AppRepository.self)!
            )
        }
        container.register(GetFeatureFlagsUseCase.self) { r in
            return GetFeatureFlagsUseCase(
                appRepository: r.resolve(AppRepository.self)!
            )
        }
        container.register(SetFeatureFlagValueUseCase.self) { r in
            return SetFeatureFlagValueUseCase(
                appRepository: r.resolve(AppRepository.self)!
            )
        }
    }
}
