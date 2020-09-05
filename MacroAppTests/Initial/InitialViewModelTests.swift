import Domain
import XCTest
@testable import MacroApp

class InitialViewModelTests: XCTestCase {
    func testBootstrapGetsConfigsAndFeatureFlags() {
        withEnvironment(.mock) {
            let ffs = [FeatureFlag.manhattanPdp: true]
            Current.appRepository = .mock(.mock, ffs)
            
            let viewModel = InitialViewModel()
            viewModel.bootstrap()
            
            XCTAssertEqual(viewModel.configs, Configs.mock)
            XCTAssertEqual(viewModel.featureFlags, ffs)
        }
    }
}
