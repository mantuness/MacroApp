import UIKit
import Swinject
import Data
import Domain
import JSPlatform

struct GlobalEnvironment {
    var appRepository = AppRepository(jsAppService: JSPlatform.AppService())
}

var Current = GlobalEnvironment()

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var delegate: CoordinatorDelegate?
    
    private let window: UIWindow
    private let initialViewControllerFactory: InitialViewControllerFactory
    private let myAccountCoordinatorFactory: MyAccountCoordinatorFactory
    init(window: UIWindow,
         initialViewControllerFactory: InitialViewControllerFactory,
         myAccountCoordinatorFactory: MyAccountCoordinatorFactory,
         delegate: CoordinatorDelegate) {
        self.window = window
        self.initialViewControllerFactory = initialViewControllerFactory
        self.myAccountCoordinatorFactory = myAccountCoordinatorFactory
        self.delegate = delegate
    }
    
    func execute() {
        let initialVC = initialViewControllerFactory.create(self)
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
    
    /// This is alternative solution, not using swinject
    /// This delegate function is no longer testable, we have a bunch of depencies that are being created here that we have no way to inject.
    /// The only solution to this would be to store this dependencies as class properties of the AppCoordinator
    func didTapSettingsNonDIButton() {
        let myAccountCoordinator = MyAccountNonDiCoordinator(
            settingsViewControllerFactory: SettingsNonDIViewControllerFactory(),
            delegate: self,
            anchorVC: window.rootViewController!
        )
        addChildCoordinator(myAccountCoordinator)
        myAccountCoordinator.execute()
    }
    
    func didTapSettingsCurrentPatternButton() {
        // TODO: this can all be delete, no longer needed to inject this dependencies
        let myAccountCoordinator = MyAccountNonDiCoordinator(
            settingsViewControllerFactory: .init(),
            delegate: self,
            anchorVC: window.rootViewController!
        )
        addChildCoordinator(myAccountCoordinator)
        myAccountCoordinator.execute()
    }
}


final class AppCoordinatorFactory {
    private let initialViewControllerFactory: InitialViewControllerFactory
    private let myAccountCoordinatorFactory: MyAccountCoordinatorFactory
    init(initialViewControllerFactory: InitialViewControllerFactory, myAccountCoordinatorFactory: MyAccountCoordinatorFactory) {
        self.initialViewControllerFactory = initialViewControllerFactory
        self.myAccountCoordinatorFactory = myAccountCoordinatorFactory
    }
    
    func create(window: UIWindow, coordinatorDelegate: CoordinatorDelegate) -> AppCoordinator {
        return AppCoordinator(window: window,
                              initialViewControllerFactory: initialViewControllerFactory,
                              myAccountCoordinatorFactory: myAccountCoordinatorFactory,
                              delegate: coordinatorDelegate)
    }
}
