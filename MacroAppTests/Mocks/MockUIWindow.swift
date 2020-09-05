import Foundation
import UIKit

class MockUIWindow: UIWindow {
    var didSetRootViewController = false
    
    override var rootViewController: UIViewController? {
        didSet {
            didSetRootViewController = true
        }
    }
}
