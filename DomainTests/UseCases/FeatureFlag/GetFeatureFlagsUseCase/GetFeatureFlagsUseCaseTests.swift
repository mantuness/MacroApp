import XCTest
@testable import Domain

class GetFeatureFlagsUseCaseTests: XCTestCase {
    
    func testExecuteSucceedsWithFeatureFlags() {
        let mockedFeatureFlags: [FeatureFlag: Bool] = .mock
        let input: GetFeatureFlagsUseCase.Input = .mock(mockedFeatureFlags) { result in
            switch result {
            case .success(let featureFlags):
                XCTAssertEqual(featureFlags, mockedFeatureFlags)
            case .failure(let error):
                XCTFail("Didn't expect to fail with \(error)")
            }
        }
        
        let result = GetFeatureFlagsUseCase().execute(input)
        
        XCTAssertEqual(result, mockedFeatureFlags)
    }
    
    func testExecuteFailsWithError() {
        let mockedError = NSError.mock
        let input: GetFeatureFlagsUseCase.Input = .failureMock(mockedError) { result in
            switch result {
            case .success(let featureFlags):
                XCTFail("Didn't expect to succeed with \(featureFlags)")
            case .failure(let error):
                XCTAssertEqual(mockedError, error as NSError)
            }
        }
        
        let result = GetFeatureFlagsUseCase().execute(input)
        
        XCTAssertNil(result)
    }
    
}
