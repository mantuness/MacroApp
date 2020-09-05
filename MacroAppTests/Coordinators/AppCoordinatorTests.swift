import XCTest
@testable import MacroApp

class AppCoordinatorTests: XCTestCase {
    func testExecuteSetsRootViewController() {
        withEnvironment(.mock) {
            let coordinator = AppCoordinator()
            coordinator.execute()
            
            let window = GlobalEnvironment.mock.window as? MockUIWindow
            
            XCTAssert(window?.didSetRootViewController == true)
            XCTAssertNotNil(window?.rootViewController as? InitialViewController)
        }
    }
    
    
    func testDidTapSettingsButtonAddsMyAccountCoordinator() {
        var mockedEnvironment = GlobalEnvironment.mock
        var didCallMyAccountCoordinator = false
        var didCallMyAccountCoordinatorExecute = false
        var myAccountCoordinator: MyAccountCoordinator!
        
        mockedEnvironment.myAccountCoordinator = { anchorVC in
            didCallMyAccountCoordinator =  true
            myAccountCoordinator = MyAccountCoordinator(anchorVC: anchorVC)
                        
            myAccountCoordinator.execute = {
                didCallMyAccountCoordinatorExecute = true
            }
            
            return myAccountCoordinator
        }
        
        withEnvironment(mockedEnvironment) {
            let coordinator = AppCoordinator()
            coordinator.execute()
            coordinator.didTapSettingsButton()
            
            XCTAssertNotNil(didCallMyAccountCoordinator)
            XCTAssertNotNil(coordinator.childCoordinators.last)
            XCTAssert(coordinator.childCoordinators.last === myAccountCoordinator)
            XCTAssertTrue(didCallMyAccountCoordinatorExecute)
        }
    }
    
    func testDidFinishRemovesAllChildCoordinators() {
        var mockedEnvironment = GlobalEnvironment.mock
        var myAccountCoordinator: MyAccountCoordinator!
        
        mockedEnvironment.myAccountCoordinator = { anchorVC in
            myAccountCoordinator = MyAccountCoordinator(anchorVC: anchorVC)
            return myAccountCoordinator
        }
        
        withEnvironment(mockedEnvironment) {
            let coordinator = AppCoordinator()
            coordinator.execute()
            coordinator.didTapSettingsButton()
            
            XCTAssertTrue(coordinator.childCoordinators.count == 1)
            
            coordinator.didFinish(coordinator: myAccountCoordinator, arguments: [:])
            
            XCTAssertTrue(coordinator.childCoordinators.isEmpty)
        }
    }
}
