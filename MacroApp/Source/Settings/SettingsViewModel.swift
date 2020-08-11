import Foundation
import Domain
import Swinject

final class SettingsViewModel {
    private let getFFUseCase: GetFeatureFlagsUseCase
    private let setFFValueUseCase: SetFeatureFlagValueUseCase
    private let getConfigsUseCase: GetConfigsUseCase
    init(getFFUseCase: GetFeatureFlagsUseCase,
         setFFValueUseCase: SetFeatureFlagValueUseCase,
         getConfigsUseCase: GetConfigsUseCase) {
        self.getFFUseCase = getFFUseCase
        self.setFFValueUseCase = setFFValueUseCase
        self.getConfigsUseCase = getConfigsUseCase
    }
}
