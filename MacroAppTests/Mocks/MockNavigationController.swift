import Foundation
import UIKit

class MockNavigationController: UINavigationController {
    var didCallPushViewController = false
    var didCallDismiss = false
    var didCallSetNavigationBarHidden: DidCallNavigationBarHidden = .didntCall
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        didCallPushViewController = true
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        didCallDismiss = true
    }
    
    override func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        didCallSetNavigationBarHidden = .didCallWithValue(hidden)
    }
}

extension MockNavigationController {
    enum DidCallNavigationBarHidden: Equatable {
        case didCallWithValue(Bool)
        case didntCall
    }
}
