import Foundation
import Domain
import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(InitialViewModel.self) { r in
            return InitialViewModel(getConfigsUseCase: r.resolve(GetConfigsUseCase.self)!,
                                    getFFUseCase: r.resolve(GetFeatureFlagsUseCase.self)!)
        }
        container.register(UserViewModelFactory.self) { r in
            return UserViewModelFactory(createUserProvider: r.resolve(Provider<CreateUserUseCase>.self)!,
                                        deleteUserUseCaseProvider: r.resolve(Provider<DeleteUserUseCase>.self)!,
                                       getUserUseCaseProvider: r.resolve(Provider<GetUserUseCase>.self)!)
        }
        container.register(SettingsViewModel.self) { r in
            return SettingsViewModel(getFFUseCase: r.resolve(GetFeatureFlagsUseCase.self)!,
                                     setFFValueUseCase: r.resolve(SetFeatureFlagValueUseCase.self)!,
                                     getConfigsUseCase: r.resolve(GetConfigsUseCase.self)!,
                                     validateUserIdUseCase: r.resolve(ValidateUserIdUseCase.self)!)
        }
    }
}
