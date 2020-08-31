import UIKit
import Swinject

final class MyAccountNonDiCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var delegate: CoordinatorDelegate?
    
    private var navigationVC: UINavigationController?
    
    private let settingsViewControllerFactory: SettingsNonDIViewControllerFactory
    private let anchorVC: UIViewController
    
    init(settingsViewControllerFactory: SettingsNonDIViewControllerFactory,
         delegate: CoordinatorDelegate,
         anchorVC: UIViewController) {
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
extension MyAccountNonDiCoordinator: SettingsViewControllerDelegate {
    func didPressUserButton(userId: Int) {
        
    }
    
    func didTapClose() {
        navigationVC?.dismiss(animated: true, completion: {
            self.delegate?.didFinish(coordinator: self, arguments: nil)
        })
    }
}

// MARK: - UserViewControllerDelegate
extension MyAccountNonDiCoordinator: UserViewControllerDelegate {
    func goBack() {
        // Just for demo purposes, the user controller is already being popped by iOS  (check viewDidDisappear from UserViewController)
    }
}

final class MyAccountNonDICoordinatorFactory {
    private let settingsViewControllerFactory: SettingsNonDIViewControllerFactory
    private let settingsViewModel: SettingsViewModel
    
    init(settingsViewControllerFactory: SettingsNonDIViewControllerFactory, settingsViewModel: SettingsViewModel) {
        self.settingsViewControllerFactory = settingsViewControllerFactory
        self.settingsViewModel = settingsViewModel
    }
    
    func create(anchorVC: UIViewController, coordinatorDelegate: CoordinatorDelegate) -> MyAccountNonDiCoordinator {
        return MyAccountNonDiCoordinator(
            settingsViewControllerFactory: settingsViewControllerFactory.self,
            delegate: coordinatorDelegate,
            anchorVC: anchorVC
        )
    }
    
}
