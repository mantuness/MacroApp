import Foundation
import Domain
import Swinject

final class InitialViewModel {
    func bootstrap() {
        getConfigs()
        getFeatureFlags()
    }
    
    private func getConfigs() {
        let inputForConfigs = GetConfigsUseCase.Input(
            appRepository: Current.appRepository,
            completion: { result in
                if case .success(let configs) = result {
                    print("Success with configs \(configs)")
                } else {
                    print("Shit happens")
                }
            }
        )
        _ = GetConfigsUseCase().execute(inputForConfigs)
    }
    
    private func getFeatureFlags() {
        let inputForFF = GetFeatureFlagsUseCase.Input(
            appRepository: Current.appRepository,
            completion: { result in
                if case .success(let ff) = result {
                    print("Success with feature flags \(ff)")
                } else {
                    print("Shit happens")
                }
            }
        )
        _ = GetFeatureFlagsUseCase().execute(inputForFF)
    }
}

extension InitialViewModel {
    static var mock: InitialViewModel = .init()
}
