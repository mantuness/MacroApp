import UIKit

enum CoordinatorArgumentKey {
    // Example how to define arguments to pass when didFinish is called
    case argument1
    case argument2
}

protocol CoordinatorDelegate: class {
    func didFinish(coordinator: Coordinator, arguments: [CoordinatorArgumentKey: Any]?)
}

protocol Coordinator: class {

    var childCoordinators: [Coordinator] { get set }

    // Implementation should always enforce weak
    var delegate: CoordinatorDelegate? { get set }

    var execute: () -> Void { get set }
}

extension Coordinator {

    // Add a child coordinator to the parent
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }

    // Remove a child coordinator from the parent
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }

}
