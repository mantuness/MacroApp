import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
//        let viewModel = ViewModel(congifUseCase: Application.shared.useCaseProvider.makeConfigUseCase())
//        let vc = UIViewController
        
//        let useCaseProvider: Domain.UseCaseProvider = JSUseCaseProvider()
//        let viewModel = ViewModel(congifUseCase: useCaseProvider.makeConfigUseCase())
//        let vc = UIViewController(viewModel: viewmODEL)
    }
}

//protocol ViewModelProvider {}
//extension ViewModelProvider {
//    var provider: Domain.UseCaseProvider {
//        return JSUseCaseProvider()
//    }
//}
//
//class Application {
//    let useCaseProvider: Domain.UseCaseProvider
//    
//    let shared = Application()
//    private init() {
//        useCaseProvider = JSUseCaseProvider()
//    }
//}