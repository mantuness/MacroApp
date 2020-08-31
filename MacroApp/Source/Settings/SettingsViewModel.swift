import Foundation
import Domain
import Swinject

final class SettingsViewModel {
    func validateData(userId: Int) -> Bool {
        // TODO: - this is not tested at the moment. To test it ValidateUserIdUseCase either goes to Current or we do the same pattern on the other UseCases
        return ValidateUserIdUseCase().execute(userId)
    }
}
