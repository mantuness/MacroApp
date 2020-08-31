import Foundation

public struct GetFeatureFlagsUseCase: UseCase {
    public struct Input {
        public let appRepository: AppRepository
        
        public let completion: (Result<[FeatureFlag : Bool], Error>) -> Void
        public init(appRepository: AppRepository, completion: @escaping (Result<[FeatureFlag : Bool], Error>) -> Void) {
            self.appRepository = appRepository
            self.completion = completion
        }
    }
    public var execute: (Input) -> [FeatureFlag: Bool]? = { input in
        input.appRepository.getFeatureFlags(completion: input.completion)
    }
    
    public init() {
        
    }
        
    internal init(execute: @escaping (Input) -> [FeatureFlag: Bool]?) {
        self.execute = execute
    }
}

extension GetFeatureFlagsUseCase {
    public static let mock: Self = .init { _ in .mock }
}
