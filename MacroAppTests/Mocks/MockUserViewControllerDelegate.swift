import Foundation
@testable import MacroApp

class MockUserViewControllerDelegate: UserViewControllerDelegate {
    var didCallGoBack = false
    
    func goBack() {
        didCallGoBack = true
    }
}
