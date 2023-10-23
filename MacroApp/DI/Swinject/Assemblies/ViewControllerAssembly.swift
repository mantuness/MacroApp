import Foundation
import Domain
import Swinject

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(InitialViewControllerFactory.self) { r in
            return ResolverInitialViewControllerFactory(
                viewModelProvider: r.resolve(Provider<InitialViewModel>.self)!
            )
        }
        container.register(UserViewControllerFactory.self) { r in
            return FactoryUserViewControllerFactory(
                viewModelFactory: r.resolve(UserViewModelFactory.self)!
            )
        }
        container.register(SettingsViewControllerFactory.self) { r in
            return ResolverSettingsViewControllerFactory(
                viewModelProvider: r.resolve(Provider<SettingsViewModel>.self)!
            )
        }
    }
}
