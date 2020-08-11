import Foundation
import Domain
import Swinject

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(InitialViewControllerFactory.self) { r in
            return InitialViewControllerFactory(viewModelProvider: r.resolve(Provider<InitialViewModel>.self)!)
        }
        container.register(UserViewControllerFactory.self) { r in
            return UserViewControllerFactory(viewModelFactory: r.resolve(UserViewModelFactory.self)!)
        }
        container.register(SettingsViewControllerFactory.self) { r in
            return SettingsViewControllerFactory(viewModelProvider: r.resolve(Provider<SettingsViewModel>.self)!)
        }
    }
}
