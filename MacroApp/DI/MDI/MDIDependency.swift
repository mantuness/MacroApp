import Data
import Domain
import JSPlatform
import MDI

class MDIDependency { }

@SingletonRegister((any JSClient).self, factory: JSClientImpl.init)
@AutoRegister((any UserService).self, factory: JSUserService.init(client:))
@AutoRegister((any AppService).self, factory: JSAppService.init(client:))
extension MDIDependency { }

@FactoryRegister(UserViewModel.self, parameterTypes: Int.self, factory: UserViewModel.make(with:))
@AutoRegister(SettingsViewModel.self, factory: SettingsViewModel.init(getFFUseCase:setFFValueUseCase:getConfigsUseCase:validateUserIdUseCase:))
@AutoRegister(ViewModelProvider.self, factory: ViewModelProvider.init)
@AutoRegister((any InitialViewControllerFactory).self, factory: MDIInitialViewControllerFactory.init(viewModelProvider:))
@AutoRegister((any SettingsViewControllerFactory).self, factory: MDISettingsViewControllerFactory.init)
//@AutoRegister((any UserViewModelFactory).self, factory: MDIUserViewModelFactory.init)
@AutoRegister((any UserViewControllerFactory).self, factory: MDIUserViewControllerFactory.init)
@AutoRegister(MyAccountCoordinatorFactory.self, factory: MyAccountCoordinatorFactory.init(userViewControllerFactory:settingsViewControllerFactory:))
@AutoRegister(AppCoordinatorFactory.self, factory: AppCoordinatorFactory.init(initialViewControllerFactory:myAccountCoordinatorFactory:))
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
