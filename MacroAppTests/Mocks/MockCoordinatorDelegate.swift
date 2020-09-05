import Foundation
@testable import MacroApp

class MockCoordinatorDelegate: CoordinatorDelegate {
    var didCallDidFinish = false
    
    func didFinish(coordinator: Coordinator, arguments: [CoordinatorArgumentKey: Any]?) {
        didCallDidFinish = true
    }
}
