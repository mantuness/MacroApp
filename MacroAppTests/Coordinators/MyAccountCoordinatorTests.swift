import XCTest
@testable import MacroApp

class MyAccountCoordinatorTests: XCTestCase {
    func testExecutePresentsSettingsViewController() {
        withEnvironment(.mock) {
            let mockViewController = MockViewController()
            
            Current.window?.rootViewController = mockViewController
            Current.window?.makeKeyAndVisible()
            Current.rootViewController?.loadView()

            let coordinator = MyAccountCoordinator(anchorVC: mockViewController)
            coordinator.execute()
            
            XCTAssertTrue(mockViewController.didCallPresentViewController)
            XCTAssertNotNil(mockViewController.presentedViewController)
            
            let navigationController = mockViewController.presentedViewController as? UINavigationController
            
            XCTAssertTrue(navigationController?.modalPresentationStyle == .fullScreen)
            XCTAssertNotNil(navigationController?.visibleViewController is SettingsViewController)
        }
    }
    
    func testDidPressUserButtonPushesUserViewController() {
        withEnvironment(.mock) {
            let mockViewController = MockViewController()
            
            let coordinator = MyAccountCoordinator(anchorVC: mockViewController)
            var navigationController: MockNavigationController!
            coordinator.wrapInNavigationController = {
                navigationController = MockNavigationController(
                    rootViewController: $0
                )
                return navigationController
            }

            coordinator.execute()
            coordinator.didPressUserButton(userId: 0)
            
            XCTAssertTrue(navigationController.didCallPushViewController)
        }
    }
    
    func testDidTapClose() {
        withEnvironment(.mock) {
            let mockViewController = MockViewController()
            
            let coordinator = MyAccountCoordinator(anchorVC: mockViewController)
            var navigationController: MockNavigationController!
            coordinator.wrapInNavigationController = {
                navigationController = MockNavigationController(
                    rootViewController: $0
                )
                return navigationController
            }
            
            let mockDelegate = MockCoordinatorDelegate()
            coordinator.delegate = mockDelegate
            
            coordinator.execute()
            coordinator.didTapClose()
            
            XCTAssertTrue(navigationController.didCallDismiss)
            XCTAssertTrue(mockDelegate.didCallDidFinish)
        }
    }
    
    func testDidTapGoBack() {
        withEnvironment(.mock) {
            let mockViewController = MockViewController()
            
            let coordinator = MyAccountCoordinator(anchorVC: mockViewController)
            
            coordinator.execute()
            coordinator.goBack()
            
            // There's nothing to assert as it does not have an implementation
        }
    }
}
