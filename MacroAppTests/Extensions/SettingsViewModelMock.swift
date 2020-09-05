import Domain
import Foundation
@testable import MacroApp

extension SettingsViewModel {
    static let mock: (Bool) -> SettingsViewModel = { result in
        var viewModel = SettingsViewModel()
        viewModel.getValidateDataUseCase = {
            var useCase = ValidateUserIdUseCase()
            useCase.execute = { _ in result }
            return useCase
        }
        return viewModel
    }
}
