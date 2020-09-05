import Foundation
@testable import MacroApp

class MockInitialViewControllerDelegate: InitialViewControllerDelegate {
    var didCallTapSettingsButton = false
    
    func didTapSettingsButton() {
        didCallTapSettingsButton = true
    }
}
