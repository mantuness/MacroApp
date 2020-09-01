import UIKit
import Swinject
import Data
import Domain
import JSPlatform

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var delegate: CoordinatorDelegate?
    
    private let window: UIWindow
    private let myAccountCoordinatorFactory: MyAccountCoordinatorFactory
    init(window: UIWindow,
         myAccountCoordinatorFactory: MyAccountCoordinatorFactory,
         delegate: CoordinatorDelegate) {
        self.window = window
        self.myAccountCoordinatorFactory = myAccountCoordinatorFactory
        self.delegate = delegate
    }
    
    func execute() {
        let initialVC = InitialViewController(delegate: self)
        window.rootViewController = initialVC
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
        let myAccountCoordinator = myAccountCoordinatorFactory.create(anchorVC: window.rootViewController!, coordinatorDelegate: self)
        addChildCoordinator(myAccountCoordinator)
        myAccountCoordinator.execute()
    }
    
    func didTapSettingsCurrentPatternButton() {
        // TODO: this can all be delete, no longer needed to inject this dependencies
        let myAccountCoordinator = MyAccountCoordinator(
            delegate: self,
            anchorVC: window.rootViewController!
        )
        addChildCoordinator(myAccountCoordinator)
        myAccountCoordinator.execute()
    }
}


final class AppCoordinatorFactory {
    private let myAccountCoordinatorFactory: MyAccountCoordinatorFactory
    init(myAccountCoordinatorFactory: MyAccountCoordinatorFactory) {
        self.myAccountCoordinatorFactory = myAccountCoordinatorFactory
    }
    
    func create(window: UIWindow, coordinatorDelegate: CoordinatorDelegate) -> AppCoordinator {
        return AppCoordinator(window: window,
                              myAccountCoordinatorFactory: myAccountCoordinatorFactory,
                              delegate: coordinatorDelegate)
    }
}
