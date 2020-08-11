import Foundation
import Domain
import Swinject

final class InitialViewModel {
    private let getConfigsUseCase: GetConfigsUseCase
    private let getFFUseCase: GetFeatureFlagsUseCase
    init(getConfigsUseCase: GetConfigsUseCase,
         getFFUseCase: GetFeatureFlagsUseCase) {
        self.getConfigsUseCase = getConfigsUseCase
        self.getFFUseCase = getFFUseCase
    }
    
    func bootstrap() {
        getConfigs()
        getFeatureFlags()
    }
    
    private func getConfigs() {
        let inputForConfigs = GetConfigsUseCase.Input(completion: { result in
            if case .success(let configs) = result {
                print("Success with configs \(configs)")
            } else {
                print("Shit happens")
            }
        })
        _ = getConfigsUseCase.execute(input: inputForConfigs)
    }
    
    private func getFeatureFlags() {
        let inputForFF = GetFeatureFlagsUseCase.Input(completion: { result in
            if case .success(let ff) = result {
                print("Success with feature flags \(ff)")
            } else {
                print("Shit happens")
            }
        })
        _ = getFFUseCase.execute(input: inputForFF)
    }
}
