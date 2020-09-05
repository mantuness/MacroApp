import Foundation
import UIKit

class MockViewController: UIViewController {
    var didCallPresentViewController = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        didCallPresentViewController = true
    }
}
