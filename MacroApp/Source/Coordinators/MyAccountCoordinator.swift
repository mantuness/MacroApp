import UIKit
import Swinject

final class MyAccountCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var delegate: CoordinatorDelegate?
    
    private var navigationVC: UINavigationController?
    
    private let userViewControllerFactory: UserViewControllerFactory
    private let settingsViewControllerFactory: SettingsViewControllerFactory
    private let anchorVC: UIViewController
    init(userViewControllerFactory: UserViewControllerFactory,
         settingsViewControllerFactory: SettingsViewControllerFactory,
         delegate: CoordinatorDelegate,
         anchorVC: UIViewController) {
        self.userViewControllerFactory = userViewControllerFactory
        self.settingsViewControllerFactory = settingsViewControllerFactory
        self.delegate = delegate
        self.anchorVC = anchorVC
    }
    
    func execute() {
        let settingsVC = settingsViewControllerFactory.create(delegate: self)
        navigationVC = UINavigationController(rootViewController: settingsVC)
        navigationVC?.modalPresentationStyle = .fullScreen
        anchorVC.present(navigationVC!, animated: false, completion: nil)
    }
}

// MARK: - SettingsViewControllerDelegate
extension MyAccountCoordinator: SettingsViewControllerDelegate {
    func didPressUserButton(userId: Int) {
        let userVC = userViewControllerFactory.create(id: userId, delegate: self)
        navigationVC?.pushViewController(userVC, animated: true)
    }
    
    func didTapClose() {
        navigationVC?.dismiss(animated: true, completion: {
            self.delegate?.didFinish(coordinator: self, arguments: nil)
        })
    }
}

// MARK: - UserViewControllerDelegate
extension MyAccountCoordinator: UserViewControllerDelegate {
    func goBack() {
        // Just for demo purposes, the user controller is already being popped by iOS  (check viewDidDisappear from UserViewController)
    }
}

final class MyAccountCoordinatorFactory {
    private let userViewControllerFactory: UserViewControllerFactory
    private let settingsViewControllerFactory: SettingsViewControllerFactory
    init(userViewControllerFactory: UserViewControllerFactory, settingsViewControllerFactory: SettingsViewControllerFactory) {
        self.userViewControllerFactory = userViewControllerFactory
        self.settingsViewControllerFactory = settingsViewControllerFactory
    }
    
    func create(anchorVC: UIViewController, coordinatorDelegate: CoordinatorDelegate) -> MyAccountCoordinator {
        return MyAccountCoordinator(userViewControllerFactory: userViewControllerFactory,
                                    settingsViewControllerFactory: settingsViewControllerFactory,
                                    delegate: coordinatorDelegate,
                                    anchorVC: anchorVC)
    }
}
