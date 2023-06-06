import Foundation
import Domain
import Factory

extension Container {
    var appCoordinatorFactory: Factory<AppCoordinatorFactory> {
        Factory(self) {
            AppCoordinatorFactory(
                initialViewControllerFactory: self.initialViewControllerFactory.resolve(),
                myAccountCoordinatorFactory: self.myAccountCoordinatorFactory.resolve()
            )
        }
    }
    var myAccountCoordinatorFactory: Factory<MyAccountCoordinatorFactory> {
        Factory(self) {
            MyAccountCoordinatorFactory(
                userViewControllerFactory: self.userViewControllerFactory.resolve(),
                settingsViewControllerFactory: self.settingsViewControllerFactory.resolve()
            )
        }
    }
}
