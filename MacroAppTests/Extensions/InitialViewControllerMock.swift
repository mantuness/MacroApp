import Foundation
@testable import MacroApp

extension InitialViewController {
    static let mock: InitialViewController = .init(delegate: MockInitialViewControllerDelegate())
}
