import UIKit
import Swinject
import Data
import Domain
import JSPlatform

extension JSClientImpl {
    static let mock = JSClientImpl()
}

extension JSAppService {
    static let mock = JSAppService(client: JSClientImpl.mock)
}

extension AppRepositoryImpl {
    static let mock = AppRepositoryImpl(appService: JSAppService.mock)
}

extension GetFeatureFlagsUseCase {
    static let mock = GetFeatureFlagsUseCase(appRepository: AppRepositoryImpl.mock)
}

struct GlobalEnvironment {
    var appRepository = AppRepositoryImpl(appService: JSAppService(client: JSClientImpl()))
    var getFFUseCase: GetFeatureFlagsUseCase {
        .init(appRepository: appRepository)
    }
    
    var setFFUseCase: SetFeatureFlagValueUseCase {
        .init(appRepository: appRepository)
    }
    
    var getConfigsUseCase: GetConfigsUseCase {
        .init(appRepository: appRepository)
    }
    
    var validateUserIdUseCase = ValidateUserIdUseCase()
    
    var settingsEnvironment: SettingsEnvironment {
        .init()
    }
}

struct SettingsEnvironment {
    var factory = SettingsNonDIViewControllerFactory()
    var viewModel = SettingsViewModel(
        getFFUseCase: Current.getFFUseCase,
        setFFValueUseCase: Current.setFFUseCase,
        getConfigsUseCase: Current.getConfigsUseCase,
        validateUserIdUseCase: Current.validateUserIdUseCase
    )
}

var Current = GlobalEnvironment()

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var delegate: CoordinatorDelegate?
    
    private let window: UIWindow
    private let initialViewControllerFactory: InitialViewControllerFactory
    private let myAccountCoordinatorFactory: MyAccountCoordinatorFactory
    init(window: UIWindow,
         initialViewControllerFactory: InitialViewControllerFactory,
         myAccountCoordinatorFactory: MyAccountCoordinatorFactory,
         delegate: CoordinatorDelegate) {
        self.window = window
        self.initialViewControllerFactory = initialViewControllerFactory
        self.myAccountCoordinatorFactory = myAccountCoordinatorFactory
        self.delegate = delegate
    }
    
    func execute() {
        let initialVC = initialViewControllerFactory.create(delegate: self)
        window.rootViewController = initialVC
    }
}

// MARK: - CoordinatorDelegate
extension AppCoordinator: CoordinatorDelegate {
    func didFinish(coordinator: Coordinator, arguments: [CoordinatorArgumentKey : Any]?) {
        removeChildCoordinator(coordinator)
    }
}

// MARK: - InitialViewControllerDelegate
extension AppCoordinator: InitialViewControllerDelegate {
    func didTapSettingsButton() {
        let myAccountCoordinator = myAccountCoordinatorFactory.create(anchorVC: window.rootViewController!, coordinatorDelegate: self)
        addChildCoordinator(myAccountCoordinator)
        myAccountCoordinator.execute()
    }
    
    /// This is alternative solution, not using swinject
    /// This delegate function is no longer testable, we have a bunch of depencies that are being created here that we have no way to inject.
    /// The only solution to this would be to store this dependencies as class properties of the AppCoordinator
    func didTapSettingsNonDIButton() {
        let client = JSClientImpl()
        let jsAppService = JSAppService(client: client)
        let appRepository = AppRepositoryImpl(appService: jsAppService)
        
        let myAccountCoordinator = MyAccountNonDiCoordinator(
            settingsViewControllerFactory: SettingsNonDIViewControllerFactory(),
            settingsViewModel: .init(
                getFFUseCase: .init(appRepository: appRepository),
                setFFValueUseCase: .init(appRepository: appRepository),
                getConfigsUseCase: .init(appRepository: appRepository),
                validateUserIdUseCase: .init()
            ),
            delegate: self,
            anchorVC: window.rootViewController!
        )
        addChildCoordinator(myAccountCoordinator)
        myAccountCoordinator.execute()
    }
    
    func didTapSettingsCurrentPatternButton() {
        let settingsEnvironment = Current.settingsEnvironment
        let myAccountCoordinator = MyAccountNonDiCoordinator(
            settingsViewControllerFactory: settingsEnvironment.factory,
            settingsViewModel: settingsEnvironment.viewModel,
            delegate: self,
            anchorVC: window.rootViewController!
        )
        addChildCoordinator(myAccountCoordinator)
        myAccountCoordinator.execute()
    }
}


final class AppCoordinatorFactory {
    private let initialViewControllerFactory: InitialViewControllerFactory
    private let myAccountCoordinatorFactory: MyAccountCoordinatorFactory
    init(initialViewControllerFactory: InitialViewControllerFactory, myAccountCoordinatorFactory: MyAccountCoordinatorFactory) {
        self.initialViewControllerFactory = initialViewControllerFactory
        self.myAccountCoordinatorFactory = myAccountCoordinatorFactory
    }
    
    func create(window: UIWindow, coordinatorDelegate: CoordinatorDelegate) -> AppCoordinator {
        return AppCoordinator(window: window,
                              initialViewControllerFactory: initialViewControllerFactory,
                              myAccountCoordinatorFactory: myAccountCoordinatorFactory,
                              delegate: coordinatorDelegate)
    }
}
