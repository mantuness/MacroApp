import XCTest
@testable import MacroApp

class SettingsViewControllerTests: XCTestCase {
    
    func testInitWithCoderReturnsNil() {
        let viewController = SettingsViewController(coder: .init())
        XCTAssertNil(viewController)
    }
    
    func testViewWillAppearCallsSetNavigationBarHidden() {
        let viewController: SettingsViewController = .mock
        
        let navigationController = MockNavigationController(rootViewController: viewController)
        
        viewController.viewWillAppear(false)
        
        XCTAssertTrue(
            navigationController.didCallSetNavigationBarHidden == .didCallWithValue(true)
        )
    }
    
    func testViewWillDisappearCallsSetNavigationBarHidden() {
        let viewController: SettingsViewController = .mock
        
        let navigationController = MockNavigationController(rootViewController: viewController)
        
        viewController.viewWillDisappear(false)
        
        XCTAssertTrue(
            navigationController.didCallSetNavigationBarHidden == .didCallWithValue(false)
        )
    }
    
    func testButtonTappedCallsDelegate() {
        let delegate = MockSettingsViewControllerDelegate()
        let viewController: SettingsViewController = .init(delegate: delegate)
        
        viewController.loadView()
        
        viewController.buttonTapped(.init())
        
        XCTAssertFalse(delegate.didCallDidPressUserButton)
        
        viewController.textField.text = "1234"
        
        viewController.buttonTapped(.init())
        
        XCTAssertTrue(delegate.didCallDidPressUserButton)
    }
    
    func testDidTapCloseCallsDelegate() {
        let delegate = MockSettingsViewControllerDelegate()
        let viewController: SettingsViewController = .init(delegate: delegate)

        viewController.didTapClose(.init())
        
        XCTAssertTrue(delegate.didCallDidTapClose)
    }
}
