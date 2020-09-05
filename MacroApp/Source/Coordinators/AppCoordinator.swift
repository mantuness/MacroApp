import UIKit
import Data
import Domain
import JSPlatform

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var delegate: CoordinatorDelegate?
    
    lazy var execute = { [weak self] in
        guard let self = self else { return }
        let initialVC = InitialViewController(delegate: self)
        Current.window?.rootViewController = initialVC
    }
}

// MARK: - CoordinatorDelegate
extension AppCoordinator: CoordinatorDelegate {
    func didFinish(coordinator: Coordinator, arguments: [CoordinatorArgumentKey : Any]?) {
        removeChildCoordinator(coordinator)
    }
}

// MARK: - InitialViewControllerDelegate
extension AppCoordinator: InitialViewControllerDelegate {
    func didTapSettingsButton() {
        let myAccountCoordinator = Current.myAccountCoordinator(
            Current.rootViewController!
        )
        
        myAccountCoordinator.delegate = self
        
        addChildCoordinator(myAccountCoordinator)
        myAccountCoordinator.execute()
    }
}
