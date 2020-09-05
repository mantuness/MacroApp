import Foundation

public struct SetFeatureFlagValueUseCase: UseCase {
    public struct Input {
        public let appRepository: AppRepository
        public let newValue: Bool
        public let featureFlag: FeatureFlag
    }
    
    public var execute: (Input) -> Void = { input in
        input.appRepository.set(input.newValue, input.featureFlag)
    }
    
    public init() {
        
    }
}
