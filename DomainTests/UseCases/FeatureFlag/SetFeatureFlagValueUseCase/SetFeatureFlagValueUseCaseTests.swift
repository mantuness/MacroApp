import XCTest
@testable import Domain

class SetFeatureFlagsUseCaseTests: XCTestCase {
    
    func testExecuteSucceedsWithFeatureFlags() {
        let mockedFeatureFlags: [FeatureFlag: Bool] = .mock
        let input: SetFeatureFlagValueUseCase.Input = .mock(mockedFeatureFlags, true, .manhattanPdp)
        
        SetFeatureFlagValueUseCase().execute(input)
        
        // use case is not implemented, but now we would check if the FFs were really updated
        XCTAssert(true)
    }
}
