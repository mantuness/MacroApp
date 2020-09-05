import XCTest
@testable import Domain

class CreateUserUseCaseTests: XCTestCase {
    
    func testExecuteSucceedsWithUser() {
        let mockedUser = User.mock
        let input = CreateUserUseCase.Input.mock(mockedUser) { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user, mockedUser)
            case .failure(let error):
                XCTFail("Didn't expect to fail with \(error)")
            }
            
        }
        
        CreateUserUseCase().execute(input)
    }
    
    func testExecuteFailsWithError() {
        let mockedError = NSError.mock
        let input = CreateUserUseCase.Input.failureMock(mockedError) { result in
            switch result {
            case .success(let user):
                XCTFail("Didn't expect to succeed with \(user)")
            case .failure(let error):
                XCTAssertEqual(mockedError, error as NSError)
            }
            
        }
        
        CreateUserUseCase().execute(input)
    }
}
