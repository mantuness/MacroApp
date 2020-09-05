import UIKit
import Swinject

final class MyAccountCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var delegate: CoordinatorDelegate?
    
    var wrapInNavigationController: (UIViewController) -> UINavigationController? = {
        .init(rootViewController: $0)
    }
    
    private let anchorVC: UIViewController
    private var navigationVC: UINavigationController?
    
    init(anchorVC: UIViewController) {
        self.anchorVC = anchorVC
    }
    
    lazy var execute = { [weak self] in
        guard let self = self else { return }
        self.navigationVC = self.wrapInNavigationController(SettingsViewController(delegate: self))
        self.navigationVC?.modalPresentationStyle = .fullScreen
        self.anchorVC.present(self.navigationVC!, animated: false, completion: nil)
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
