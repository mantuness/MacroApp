import Foundation
import Domain

final class InitialViewModel {
    var configs: Configs?
    var featureFlags: [FeatureFlag: Bool]?
    
    lazy var bootstrap = { [weak self] in
        self?.getConfigs()
        self?.getFeatureFlags()
    }
    
    private func getConfigs() {
        let inputForConfigs = GetConfigsUseCase.Input(
            appRepository: Current.appRepository,
            completion: { [weak self] result in
                switch result {
                case .success(let configs):
                    print("Success with configs \(configs)")
                    self?.configs = configs
                case .failure(let error):
                    print("Shit happens", error)
                }
            }
        )
        
        configs = GetConfigsUseCase().execute(inputForConfigs)
    }
    
    private func getFeatureFlags() {
        let inputForFF = GetFeatureFlagsUseCase.Input(
            appRepository: Current.appRepository,
            completion: { [weak self] result in
                switch result {
                case .success(let featureFlags):
                    print("Success with featureFlags \(featureFlags)")
                    self?.featureFlags = featureFlags
                case .failure(let error):
                    print("Shit happens", error)
                }
            }
        )
        featureFlags = GetFeatureFlagsUseCase().execute(inputForFF)
    }
}
