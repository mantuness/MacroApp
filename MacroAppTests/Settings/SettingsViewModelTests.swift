import XCTest
@testable import MacroApp

class SettingsViewModelTests: XCTestCase {
    func testSuccessfulyValidateData() {
        let viewModel: SettingsViewModel = .mock(true)
        
        XCTAssertTrue(viewModel.validateData(userId: 0))
    }
    
    func testFailsValidateData() {
        let viewModel: SettingsViewModel = .mock(false)
        
        XCTAssertFalse(viewModel.validateData(userId: 0))
    }
}
