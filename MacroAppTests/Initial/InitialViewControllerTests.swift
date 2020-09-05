import Domain
import XCTest
@testable import MacroApp

class InitialViewControllerTests: XCTestCase {
    
    func testInitWithCoderReturnsNil() {
        let viewController = InitialViewController(coder: .init())
        XCTAssertNil(viewController)
    }
    
    func testViewDidLoadCallsBootstrap() {
        let viewController: InitialViewController = .mock
        
        var didCallBootstrap = false

        viewController.viewModel.bootstrap = {
            didCallBootstrap = true
        }
        
        viewController.viewDidLoad()
        
        XCTAssertTrue(didCallBootstrap)
    }
    
    func testDidTapButtonCallsDelegate() {
        let delegate = MockInitialViewControllerDelegate()
        let viewController: InitialViewController = .init(delegate: delegate)
        
        viewController.didTapButton(.init())
        
        XCTAssertTrue(delegate.didCallTapSettingsButton)
    }
}
