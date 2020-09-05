import XCTest
@testable import Domain

extension SetFeatureFlagValueUseCase.Input {
    static let mock: ([FeatureFlag: Bool], Bool, FeatureFlag) -> Self = { features, newValue, featureFlag in
        .init(
            appRepository: .mock(.mock, features),
            newValue: newValue,
            featureFlag: featureFlag
        )
    }
}
