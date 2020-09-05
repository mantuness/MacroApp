import Foundation

public struct GetConfigsUseCase: UseCase {
    public struct Input {
        public let appRepository: AppRepository
        public let completion: (Result<Configs, Error>) -> Void
        public init(appRepository: AppRepository, completion: @escaping (Result<Configs, Error>) -> Void) {
            self.appRepository = appRepository
            self.completion = completion
        }
    }
    
    public var execute: (Input) -> Configs? = { input in
        return input.appRepository.getConfigs(input.completion)
    }
    
    public init() {
        
    }
}
