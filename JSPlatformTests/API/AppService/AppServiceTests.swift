import XCTest
@testable import JSPlatform

class AppServiceTests: XCTestCase {
    // MARK: - Get Configs
    func testGetConfigsSucceedesWithExpectedConfigs() {
        let sut: AppService = .mock

        sut.getConfigs { result in
            switch result {
            case .success(let configs):
                XCTAssertEqual(configs, JSConfigs.mock)
            case .failure(let error):
                XCTFail("Failed with error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetConfigsFailsWithError() {
        let sut: AppService = .failureMock
        
        sut.getConfigs { result in
            switch result {
            case .success:
                XCTFail("It shouldn't have succeeded")
            case .failure(let error):
                XCTAssertEqual(JSError.initialize(from: error), JSError.mock)
            }
        }
    }
    
    // MARK: - Feature flags
    func testGetFeatureFlagsSucceedesWithExpectedFeatureFlags() {
        let sut: AppService = .mock

        sut.getFeatureFlags { result in
            switch result {
            case .success(let featureFlags):
                XCTAssertEqual(featureFlags, JSFeatureFlags.mock)
            case .failure(let error):
                XCTFail("Failed with error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetFeatureFlagsFailsWithError() {
        let sut: AppService = .failureMock
        
        sut.getFeatureFlags { result in
            switch result {
            case .success:
                XCTFail("It shouldn't have succeeded")
            case .failure(let error):
                XCTAssertEqual(JSError.initialize(from: error), JSError.mock)
            }
        }
    }
}
