import Foundation

public final class GetConfigsUseCase: UseCase {
    public struct Input {
        public let completion: (Result<Configs, Error>) -> Void
        public init(completion: @escaping (Result<Configs, Error>) -> Void) {
            self.completion = completion
        }
    }
    private let appRepository: AppRepository
    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }
    
    public func execute(input: Input) -> Configs? {
        return appRepository.getConfigs(completion: input.completion)
    }
}
