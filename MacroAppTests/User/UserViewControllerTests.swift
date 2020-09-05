import XCTest
@testable import MacroApp

class UserViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        UserViewController.shouldBeMovingFromParent = false
        UserViewController.shouldBeBeingDismissed = false
    }
    
    func testInitWithCoderReturnsNil() {
        let viewController = UserViewController(coder: .init())
        XCTAssertNil(viewController)
    }
    
    func testViewWillDisappearWhileMovingFromParentCallsDelegate() {
        let delegate = MockUserViewControllerDelegate()
        
        let viewController: UserViewController = .init(
            id: 0,
            delegate: delegate
        )
        
        UserViewController.shouldBeMovingFromParent = true
        viewController.viewWillDisappear(false)
        XCTAssertTrue(delegate.didCallGoBack)
    }
    
    func testViewWillDisappearWhileBeingDismissedCallsDelegate() {
        let delegate = MockUserViewControllerDelegate()
        
        let viewController: UserViewController = .init(
            id: 0,
            delegate: delegate
        )
        
        UserViewController.shouldBeBeingDismissed = true
        viewController.viewWillDisappear(false)
        XCTAssertTrue(delegate.didCallGoBack)
    }
}

extension UserViewController {
    public static var shouldBeMovingFromParent = false
    public static var shouldBeBeingDismissed = false
    
    public override var isMovingFromParent: Bool {
        UserViewController.shouldBeMovingFromParent
    }
    
    public override var isBeingDismissed: Bool {
        UserViewController.shouldBeBeingDismissed
    }
}
