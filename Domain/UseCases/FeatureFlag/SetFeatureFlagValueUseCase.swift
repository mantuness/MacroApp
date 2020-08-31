import Foundation

public struct SetFeatureFlagValueUseCase: UseCase {
    public struct Input {
        public let appRepository: AppRepository
        public let newValue: Bool
        public let featureFlag: FeatureFlag
    }
    
    public var execute: (Input) -> Void = { input in
        input.appRepository.set(value: input.newValue, for: input.featureFlag)
    }
    
    public init() {
        
    }
        
    internal init(execute: @escaping (Input) -> Void) {
        self.execute = execute
    }
}

extension SetFeatureFlagValueUseCase {
    public static let mock: Self = .init()
}
