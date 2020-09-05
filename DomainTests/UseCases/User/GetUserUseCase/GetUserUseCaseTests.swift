import XCTest
@testable import Domain

class GetUserUseCaseTests: XCTestCase {
    
    func testExecuteSucceedsWithUser() {
        let mockedUser = User.mock
        let input = GetUserUseCase.Input.mock(mockedUser) { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user, mockedUser)
            case .failure(let error):
                XCTFail("Didn't expect to fail with \(error)")
            }
            
        }
        
        GetUserUseCase().execute(input)
    }
    
    func testExecuteFailsWithError() {
        let mockedError = NSError.mock
        let input = GetUserUseCase.Input.failureMock(mockedError) { result in
            switch result {
            case .success(let user):
                XCTFail("Didn't expect to succeed with \(user)")
            case .failure(let error):
                XCTAssertEqual(mockedError, error as NSError)
            }
            
        }
        
        GetUserUseCase().execute(input)
    }
}
