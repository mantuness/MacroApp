import Foundation
@testable import MacroApp
import XCTest

extension XCTestCase {
    func withEnvironment(_ env: GlobalEnvironment, body: () -> Void) {
        let previousEnv = Current
        Current = env
        body()
        Current = previousEnv
    }
}
