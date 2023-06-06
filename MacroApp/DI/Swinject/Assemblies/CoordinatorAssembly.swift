import Foundation
import Domain
import Swinject

class CoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppCoordinatorFactory.self) { r in
            return AppCoordinatorFactory(
                initialViewControllerFactory: r.resolve(InitialViewControllerFactory.self)!,
                myAccountCoordinatorFactory: r.resolve(MyAccountCoordinatorFactory.self)!
            )
        }
        container.register(MyAccountCoordinatorFactory.self) { r in
            return MyAccountCoordinatorFactory(
                userViewControllerFactory: r.resolve(UserViewControllerFactory.self)!,
                settingsViewControllerFactory: r.resolve(SettingsViewControllerFactory.self)!
            )
        }
    }
}
