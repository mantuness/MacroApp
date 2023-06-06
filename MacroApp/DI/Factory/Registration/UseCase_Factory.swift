import Foundation
import Domain
import Factory

extension Container {
    var getUserUseCase: Factory<GetUserUseCase> {
        Factory(self) {
            return GetUserUseCase(
                userRepository: self.userRepository.resolve()
            )
        }
    }
    var createUserUseCase: Factory<CreateUserUseCase> {
        Factory(self) {
            return CreateUserUseCase(
                userRepository: self.userRepository.resolve()
            )
        }
    }
    var deleteUserUseCase: Factory<DeleteUserUseCase> {
        Factory(self) {
            return DeleteUserUseCase(
                userRepository: self.userRepository.resolve()
            )
        }
    }
    var validateUserIdUseCase: Factory<ValidateUserIdUseCase> {
        Factory(self) {
            return ValidateUserIdUseCase()
        }
    }
    var getConfigsUseCase: Factory<GetConfigsUseCase> {
        Factory(self) {
            return GetConfigsUseCase(
                appRepository: self.appRepository.resolve()
            )
        }
    }
    var getFeatureFlagsUseCase: Factory<GetFeatureFlagsUseCase> {
        Factory(self) {
            return GetFeatureFlagsUseCase(
                appRepository: self.appRepository.resolve()
            )
        }
    }
    var setFeatureFlagValueUseCase: Factory<SetFeatureFlagValueUseCase> {
        Factory(self) {
            return SetFeatureFlagValueUseCase(
                appRepository: self.appRepository.resolve()
            )
        }
    }
}
