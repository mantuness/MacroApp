import Data
import Domain
import JSPlatform
import MDI

struct MDIDependency {
    private init() { }
}

@SingletonRegister((any JSClient).self, factory: JSClientImpl.init)
@AutoRegister((any UserService).self, factory: JSUserService.init(client:))
@AutoRegister((any AppService).self, factory: JSAppService.init(client:))
extension MDIDependency { }

@FactoryRegister(UserViewModel.self, parameterTypes: Int.self, factory: UserViewModel.make(with:))
@FactoryRegister(AppCoordinator.self, parameterTypes: UIWindow.self, (any CoordinatorDelegate).self, factory: AppCoordinator.make(window:coordinatorDelegate:))
@AutoRegister(SettingsViewModel.self, factory: SettingsViewModel.init(getFFUseCase:setFFValueUseCase:getConfigsUseCase:validateUserIdUseCase:))
@AutoRegister(ViewModelProvider.self, factory: ViewModelProvider.init)
extension MDIDependency { }

@AutoRegister((any InitialViewControllerFactory).self, factory: MDIInitialViewControllerFactory.init(viewModelProvider:))
@AutoRegister((any SettingsViewControllerFactory).self, factory: MDISettingsViewControllerFactory.init)
@AutoRegister((any UserViewControllerFactory).self, factory: MDIUserViewControllerFactory.init)
@AutoRegister(MyAccountCoordinatorFactory.self, factory: MyAccountCoordinatorFactory.init(userViewControllerFactory:settingsViewControllerFactory:))
extension MDIDependency { }

@AutoRegister((any AppRepository).self, factory: AppRepositoryImpl.init(appService:))
@AutoRegister((any UserRepository).self, factory: UserRepositoryImpl.init(userService:))
extension MDIDependency { }

@AutoRegister(GetFeatureFlagsUseCase.self, factory: GetFeatureFlagsUseCase.init(appRepository:))
@AutoRegister(CreateUserUseCase.self, factory: CreateUserUseCase.init(userRepository:))
@AutoRegister(DeleteUserUseCase.self, factory: DeleteUserUseCase.init(userRepository:))
@AutoRegister(GetUserUseCase.self, factory: GetUserUseCase.init(userRepository:))
@AutoRegister(GetConfigsUseCase.self, factory: GetConfigsUseCase.init(appRepository:))
@AutoRegister(ValidateUserIdUseCase.self, factory: ValidateUserIdUseCase.init)
@AutoRegister(SetFeatureFlagValueUseCase.self, factory: SetFeatureFlagValueUseCase.init(appRepository:))
extension MDIDependency { }