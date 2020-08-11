import Foundation
import Domain
import Swinject

final class SettingsViewModel {
    private let getFFUseCase: GetFeatureFlagsUseCase
    private let setFFValueUseCase: SetFeatureFlagValueUseCase
    private let getConfigsUseCase: GetConfigsUseCase
    private let validateUserIdUseCase: ValidateUserIdUseCase
    init(getFFUseCase: GetFeatureFlagsUseCase,
         setFFValueUseCase: SetFeatureFlagValueUseCase,
         getConfigsUseCase: GetConfigsUseCase,
         validateUserIdUseCase: ValidateUserIdUseCase) {
        self.getFFUseCase = getFFUseCase
        self.setFFValueUseCase = setFFValueUseCase
        self.getConfigsUseCase = getConfigsUseCase
        self.validateUserIdUseCase = validateUserIdUseCase
    }
    
    func validateData(userId: Int) -> Bool {
        return validateUserIdUseCase.execute(input: userId)
    }
}
