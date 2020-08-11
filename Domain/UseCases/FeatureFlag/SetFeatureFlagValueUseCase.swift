import Foundation

public final class SetFeatureFlagValueUseCase: UseCase {
    public struct Input {
        public let newValue: Bool
        public let featureFlag: FeatureFlag
    }
    private let appRepository: AppRepository
    public init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }
    
    public func execute(input: Input) -> Void {
        appRepository.set(value: input.newValue, for: input.featureFlag)
    }
}
