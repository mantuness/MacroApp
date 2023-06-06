import Foundation
import Domain
import Factory

extension Container {
    var initialViewModel: Factory<InitialViewModel> {
        Factory(self) {
            InitialViewModel(
                getConfigsUseCase: self.getConfigsUseCase.resolve(),
                getFFUseCase: self.getFeatureFlagsUseCase.resolve()
            )
        }
    }
    
    var userViewModelFactory: Factory<UserViewModelFactory> {
        Factory(self) {
            UserViewModelFactory(
                createUserProvider: self.createUserUseCase,
                deleteUserUseCaseProvider: self.deleteUserUseCase,
                getUserUseCaseProvider: self.getUserUseCase
            )
        }
    }
    
    var settingsViewModel: Factory<SettingsViewModel> {
        Factory(self) {
            SettingsViewModel(
                getFFUseCase: self.getFeatureFlagsUseCase.resolve(),
                setFFValueUseCase: self.setFeatureFlagValueUseCase.resolve(),
                getConfigsUseCase: self.getConfigsUseCase.resolve(),
                validateUserIdUseCase: self.validateUserIdUseCase.resolve()
            )
        }
    }
}
