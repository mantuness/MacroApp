import XCTest
@testable import Domain

class DeleteUserUseCaseTests: XCTestCase {
    
    func testExecuteSucceeds() {
        let mockedUser = User.mock
        let input = DeleteUserUseCase.Input.mock(mockedUser) { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTFail("Didn't expect to fail with \(error)")
            }
            
        }
        
        DeleteUserUseCase().execute(input)
    }
    
    func testExecuteFailsWithError() {
        let mockedError = NSError.mock
        let input = DeleteUserUseCase.Input.failureMock(mockedError) { result in
            switch result {
            case .success(let user):
                XCTFail("Didn't expect to succeed with \(user)")
            case .failure(let error):
                XCTAssertEqual(mockedError, error as NSError)
            }
            
        }
        
        DeleteUserUseCase().execute(input)
    }
}
