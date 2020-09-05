import JSPlatform
import XCTest
@testable import Data

class AppRepositoryTests: XCTestCase {

    func testGetConfigsSucceedsWithCorrectConfigs() {
        var appService = AppService()
        appService.getConfigs = { completion in
            completion(.success(JSConfigs.mock))
        }

        let result = AppRepository().getConfigs(appService)({ result in
            switch result {
            case .success(let configs):
                XCTAssertEqual(configs.asJS(), JSConfigs.mock)
            case .failure(let error):
                XCTFail("Didn't expect to fail with error: \(error)")
            }
        })
        
        XCTAssertNil(result)
    }
    
    func testGetFeatureFlagsSucceedsWithCorrectConfigs() {
        var appService = AppService()
        appService.getFeatureFlags = { completion in
            completion(.success(JSFeatureFlags.mock))
        }
        
        let result = AppRepository().getFeatureFlags(appService)({ result in
            switch result {
            case .success(let featureFlags):
                XCTAssertEqual(featureFlags, try? JSFeatureFlags.mock.asDomain())
            case .failure(let error):
                XCTFail("Didn't expect to fail with error: \(error)")
            }
        })
        
        XCTAssertNil(result)
    }
    
    
    func testGetValueReturnsNil() {
        let result = AppRepository().getValue(.init())(.manhattanPdp) { _ in }
        
        XCTAssertNil(result)
    }
    
    func testSetValue() {
        AppRepository().set(.init())(true, .manhattanPdp)
        
        XCTAssert(true)
    }
}
