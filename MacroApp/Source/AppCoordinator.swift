import UIKit
import Swinject

class NewFluxCoordinator {
    init() {}
}

class AppCoordinator {
//    let newScreenProvider: Provider<NewScreenViewController>
//    let settingsProvider: Provider<SettingsViewController>
//
//    let newFluxCoordinator: Provider<NewFluxCoordinator>
//
//    init(settingsProvider: Provider<SettingsViewController>,
//         newScreenProvider: Provider<NewScreenViewController>,
//         newFluxCoordinator: Provider<NewFluxCoordinator>) {
//        self.settingsProvider = settingsProvider
//        self.newScreenProvider = newScreenProvider
//        self.newFluxCoordinator = newFluxCoordinator
//    }
    
    
    let settingsVMFactory: SettingsViewModelFactory
    let settingsVCFactory: SettingsViewControllerFactory
    let newScreenProvider: Provider<UserViewController>
    let newFluxCoordinator: Provider<NewFluxCoordinator>
    
    init(settingsViewModelFactory: SettingsViewModelFactory,
         settingsViewControllerFactory: SettingsViewControllerFactory,
         newScreenProvider: Provider<UserViewController>,
         newFluxCoordinator: Provider<NewFluxCoordinator>) {
        self.settingsVMFactory = settingsViewModelFactory
        self.settingsVCFactory = settingsViewControllerFactory
        self.newScreenProvider = newScreenProvider
        self.newFluxCoordinator = newFluxCoordinator
    }
    
    func execute() {
        let vc = settingsVCFactory.create(viewModel: settingsVMFactory.create(id: 1), delegate: self)
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: SettingsViewControllerDelegate {
    func didPressButtonX() {
        
       //Navigate to somewhere else
    }
}
