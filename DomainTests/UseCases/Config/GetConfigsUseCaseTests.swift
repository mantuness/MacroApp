import XCTest
@testable import Domain

class GetConfigsUseCaseTests: XCTestCase {
    
    func testExecuteSucceedsWithConfigs() {
        let mockedConfigs: Configs = .mock
        let input: GetConfigsUseCase.Input = .mock(mockedConfigs) { result in
            switch result {
            case .success(let configs):
                XCTAssertEqual(configs, mockedConfigs)
            case .failure(let error):
                XCTFail("Didn't expect to fail with \(error)")
            }
        }
        
        let result = GetConfigsUseCase().execute(input)
        
        XCTAssertEqual(result, mockedConfigs)
    }
    
    func testExecuteFailsWithError() {
        let mockedError = NSError.mock
        let input: GetConfigsUseCase.Input = .failureMock(mockedError) { result in
            switch result {
            case .success(let configs):
                XCTFail("Didn't expect to succeed with \(configs)")
            case .failure(let error):
                XCTAssertEqual(mockedError, error as NSError)
            }
        }
        
        let result = GetConfigsUseCase().execute(input)
        
        XCTAssertNil(result)
    }
    
}
