import Foundation
@testable import MacroApp

class MockSettingsViewControllerDelegate: SettingsViewControllerDelegate {
    var didCallDidPressUserButton = false
    var didCallDidTapClose = false
    
    func didPressUserButton(userId: Int) {
        didCallDidPressUserButton = true
    }
    
    func didTapClose() {
        didCallDidTapClose = true
    }
}
