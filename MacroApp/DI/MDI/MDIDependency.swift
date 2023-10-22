import Data
import Domain
import JSPlatform
import MDI

struct MDIDependency {
    private init() { }
}

@OpaqueSingletonRegister((any JSClient).self, using: JSClientImpl.init)
@OpaqueAutoRegister((any UserService).self, parameterTypes: JSClient.self, using: JSUserService.init(client:))
@OpaqueAutoRegister((any AppService).self, parameterTypes: JSClient.self, using: JSAppService.init(client:))
extension MDIDependency { }

@FactoryRegister(UserViewModel.self, parameterTypes: .resolved(CreateUserUseCase.self), .resolved(DeleteUserUseCase.self), .resolved(GetUserUseCase.self), .explicit(Int.self), using: UserViewModel.init(createUserUseCase:deleteUserUseCase:getUserUseCase:id:))
@FactoryRegister(AppCoordinator.self, parameterTypes: .explicit(UIWindow.self), .explicit((any CoordinatorDelegate).self), using: AppCoordinator.make(window:coordinatorDelegate:))
@AutoRegister(SettingsViewModel.self, parameterTypes: GetFeatureFlagsUseCase.self, SetFeatureFlagValueUseCase.self, GetConfigsUseCase.self, ValidateUserIdUseCase.self, using: SettingsViewModel.init(getFFUseCase:setFFValueUseCase:getConfigsUseCase:validateUserIdUseCase:))
@AutoRegister(ViewModelProvider.self, using: ViewModelProvider.init)
extension MDIDependency { }

@OpaqueAutoRegister((any InitialViewControllerFactory).self, parameterTypes: ViewModelProvider.self, using: MDIInitialViewControllerFactory.init(viewModelProvider:))
@OpaqueAutoRegister((any SettingsViewControllerFactory).self, using: MDISettingsViewControllerFactory.init)
@OpaqueAutoRegister((any UserViewControllerFactory).self, using: MDIUserViewControllerFactory.init)
@AutoRegister(MyAccountCoordinatorFactory.self, parameterTypes: UserViewControllerFactory.self, SettingsViewControllerFactory.self, using: MyAccountCoordinatorFactory.init(userViewControllerFactory:settingsViewControllerFactory:))
extension MDIDependency { }

@OpaqueAutoRegister((any AppRepository).self, parameterTypes: AppService.self, using: AppRepositoryImpl.init(appService:))
@OpaqueAutoRegister((any UserRepository).self, parameterTypes: UserService.self, using: UserRepositoryImpl.init(userService:))
extension MDIDependency { }

@OpaqueAutoRegister(GetFeatureFlagsUseCase.self, parameterTypes: AppRepository.self, using: GetFeatureFlagsUseCase.init(appRepository:))
@OpaqueAutoRegister(CreateUserUseCase.self, parameterTypes: UserRepository.self, using: CreateUserUseCase.init(userRepository:))
@OpaqueAutoRegister(DeleteUserUseCase.self, parameterTypes: UserRepository.self, using: DeleteUserUseCase.init(userRepository:))
@OpaqueAutoRegister(GetUserUseCase.self, parameterTypes: UserRepository.self, using: GetUserUseCase.init(userRepository:))
@OpaqueAutoRegister(GetConfigsUseCase.self, parameterTypes: AppRepository.self, using: GetConfigsUseCase.init(appRepository:))
@OpaqueAutoRegister(ValidateUserIdUseCase.self, using: ValidateUserIdUseCase.init)
@OpaqueAutoRegister(SetFeatureFlagValueUseCase.self, parameterTypes: AppRepository.self, using: SetFeatureFlagValueUseCase.init(appRepository:))
extension MDIDependency { }
