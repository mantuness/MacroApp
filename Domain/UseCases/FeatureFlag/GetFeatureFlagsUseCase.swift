import Foundation

public final class GetFeatureFlagsUseCase: UseCase {
    public struct Input {
        public let completion: (Result<[FeatureFlag : Bool], Error>) -> Void
        public init(completion: @escaping (Result<[FeatureFlag : Bool], Error>) -> Void) {
            self.completion = completion
        }
    }
    private let appRepository: AppRepository
    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }
    
    public func execute(input: Input) -> [FeatureFlag: Bool]? {
        return appRepository.getFeatureFlags(completion: input.completion)
    }
}
