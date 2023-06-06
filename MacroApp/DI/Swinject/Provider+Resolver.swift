import Foundation
import Swinject

// This conformance only exists so we can easily switch between Factory and Swinject
extension Provider: Resolver {
    func getInstance() -> Service {
        return instance
    }
}
