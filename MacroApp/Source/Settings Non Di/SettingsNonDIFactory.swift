import Foundation

struct SettingsNonDIViewControllerFactory {
//    func create(viewModel: SettingsNonDIViewModel, delegate: SettingsNonDIViewControllerDelegate) -> SettingsNonDIViewController {
//        .init(viewModel: viewModel, delegate: delegate)
//    }
    
    func create(viewModel: SettingsViewModel, delegate: SettingsViewControllerDelegate) -> SettingsViewController {
        .init(viewModel: viewModel, delegate: delegate)
    }
}

