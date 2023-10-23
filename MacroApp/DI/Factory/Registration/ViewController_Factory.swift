import Foundation
import Domain
import Factory

extension Container {
    var initialViewControllerFactory: Factory<InitialViewControllerFactory> {
        Factory(self) {
            ResolverInitialViewControllerFactory(
                viewModelProvider: self.initialViewModel
            )
        }
    }
    var userViewControllerFactory: Factory<UserViewControllerFactory> {
        Factory(self) {
            FactoryUserViewControllerFactory(
                viewModelFactory: self.userViewModelFactory.resolve()
            )
        }
    }
    var settingsViewControllerFactory: Factory<SettingsViewControllerFactory> {
        Factory(self) {
            ResolverSettingsViewControllerFactory(
                viewModelProvider: self.settingsViewModel
            )
        }
    }
    
}
