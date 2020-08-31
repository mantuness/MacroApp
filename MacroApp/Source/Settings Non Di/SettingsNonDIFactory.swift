import Foundation

struct SettingsNonDIViewControllerFactory {
    func create(delegate: SettingsViewControllerDelegate) -> SettingsViewController {
        .init(delegate: delegate)
    }
}

