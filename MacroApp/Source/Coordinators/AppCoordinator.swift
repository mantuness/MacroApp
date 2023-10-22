import UIKit
import Swinject

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
        let initialVC = initialViewControllerFactory.create(delegate: self)
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

    static func make(window: UIWindow, coordinatorDelegate delegate: CoordinatorDelegate) -> AppCoordinator {
        AppCoordinator(
            window: window,
            initialViewControllerFactory: MDIDependency.resolve(InitialViewControllerFactory.self),
            myAccountCoordinatorFactory: MDIDependency.resolve(MyAccountCoordinatorFactory.self),
            delegate: delegate
        )
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
