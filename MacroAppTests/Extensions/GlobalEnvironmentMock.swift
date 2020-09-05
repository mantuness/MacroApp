import Foundation
@testable import MacroApp

extension GlobalEnvironment {
    static let mock: Self = .init(
        window: MockUIWindow(),
        appRepository: .js(),
        appCoordinator: .init()
    )
}
