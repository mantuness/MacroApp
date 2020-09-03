import Domain
import JSPlatform
import XCTest
@testable import Data

class AppRepositoryTests: XCTestCase {

    func testGetConfigsSucceedsWithCorrectConfigs() {
        var appService = AppService()
        appService.getConfigs = { completion in
            completion(.success(JSConfigs.mock))
        }
        
        let appRepository: Domain.AppRepository = AppRepository.mock(appService)

        let result = appRepository.getConfigs { result in
            switch result {
            case .success(let configs):
                XCTAssertEqual(configs.asJS(), JSConfigs.mock)
            case .failure(let error):
                XCTFail("Didn't expect to fail with error: \(error)")
            }
        }
        
        XCTAssertNil(result)
    }
    
    func testGetFeatureFlagsSucceedsWithCorrectConfigs() {
        var appService = AppService()
        appService.getFeatureFlags = { completion in
            completion(.success(JSFeatureFlags.mock))
        }
        
        let appRepository: Domain.AppRepository = AppRepository.mock(appService)

        let result = appRepository.getFeatureFlags { result in
            switch result {
            case .success(let featureFlags):
                XCTAssertEqual(featureFlags, try? JSFeatureFlags.mock.asDomain())
            case .failure(let error):
                XCTFail("Didn't expect to fail with error: \(error)")
            }
        }
        
        XCTAssertNil(result)
    }
    
    
    func testGetValueReturnsNil() {
        let appRepository: Domain.AppRepository = AppRepository.mock(.init())

        let result = appRepository.getValue(for: .manhattanPdp) { _ in }
        
        XCTAssertNil(result)
    }
    
    func testSetValue() {
        let appRepository: Domain.AppRepository = AppRepository.mock(.init())

        appRepository.set(value: true, for: .manhattanPdp)
        
        XCTAssert(true)
    }
}
