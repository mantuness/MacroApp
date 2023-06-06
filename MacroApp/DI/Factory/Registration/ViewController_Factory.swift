import Foundation
import Domain
import Factory

extension Container {
    var initialViewControllerFactory: Factory<InitialViewControllerFactory> {
        Factory(self) {
            InitialViewControllerFactory(
                viewModelProvider: self.initialViewModel
            )
        }
    }
    var userViewControllerFactory: Factory<UserViewControllerFactory> {
        Factory(self) {
            UserViewControllerFactory(
                viewModelFactory: self.userViewModelFactory.resolve()
            )
        }
    }
    var settingsViewControllerFactory: Factory<SettingsViewControllerFactory> {
        Factory(self) {
            SettingsViewControllerFactory(
                viewModelProvider: self.settingsViewModel
            )
        }
    }
    
}
