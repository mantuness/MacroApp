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
        return input.appRepository.getConfigs(completion: input.completion)
    }
    
    public init() {
        
    }
    
    internal init(execute: @escaping (Input) -> Configs?) {
        self.execute = execute
    }
}

extension GetConfigsUseCase {
    public static let mock: Self = .init { input -> Configs? in
        input.completion(
            .success(
                .init(
                    rottenTomatoesFreshMinimumValue: 0,
                    spsEndpointHost: URL(string: "http://www.valid-url.com")!
                )
            )
        )
        return nil
    }
}
