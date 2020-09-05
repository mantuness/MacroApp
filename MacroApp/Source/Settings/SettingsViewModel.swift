import Foundation
import Domain

final class SettingsViewModel {
    var getValidateDataUseCase = ValidateUserIdUseCase.init
    
    func validateData(userId: Int) -> Bool {
        getValidateDataUseCase().execute(userId)
    }
}
