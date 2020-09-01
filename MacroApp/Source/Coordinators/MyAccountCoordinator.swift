import UIKit
import Swinject

final class MyAccountCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var delegate: CoordinatorDelegate?
    
    private var navigationVC: UINavigationController?
    
    private let anchorVC: UIViewController
    init(delegate: CoordinatorDelegate, anchorVC: UIViewController) {
        self.delegate = delegate
        self.anchorVC = anchorVC
    }
    
    func execute() {
        navigationVC = UINavigationController(rootViewController: SettingsViewController(delegate: self))
        navigationVC?.modalPresentationStyle = .fullScreen
        anchorVC.present(navigationVC!, animated: false, completion: nil)
    }
}

// MARK: - SettingsViewControllerDelegate
extension MyAccountCoordinator: SettingsViewControllerDelegate {
    func didPressUserButton(userId: Int) {
        let userVC = UserViewController(id: userId, delegate: self)
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
    func create(anchorVC: UIViewController, coordinatorDelegate: CoordinatorDelegate) -> MyAccountCoordinator {
        return MyAccountCoordinator(
            delegate: coordinatorDelegate,
            anchorVC: anchorVC
        )
    }
}
