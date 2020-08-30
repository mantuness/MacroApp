import Foundation

struct SettingsNonDIViewControllerFactory {
    func create(viewModel: SettingsViewModel, delegate: SettingsViewControllerDelegate) -> SettingsViewController {
        .init(viewModel: viewModel, delegate: delegate)
    }
}

