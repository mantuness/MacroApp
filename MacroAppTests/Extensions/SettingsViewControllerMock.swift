import Foundation
@testable import MacroApp

extension SettingsViewController {
    static let mock = SettingsViewController(
        delegate: MockSettingsViewControllerDelegate()
    )
}
