import XCTest
@testable import Domain

class ValidateUserIdUseCaseTests: XCTestCase {
    
    func testExecuteCorrectIdReturnsFalse() {
        let useCase = ValidateUserIdUseCase()
        
        XCTAssertTrue(useCase.execute(1234))
    }
    
    func testExecuteWrongIdReturnsFalse() {
        let useCase = ValidateUserIdUseCase()
        
        XCTAssertFalse(useCase.execute(0))
    }
    
}
