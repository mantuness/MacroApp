import Foundation
@testable import MacroApp

extension UserViewController {
    static let mock: UserViewController = .init(
        id: 30,
        delegate: MockUserViewControllerDelegate()
    )
}
