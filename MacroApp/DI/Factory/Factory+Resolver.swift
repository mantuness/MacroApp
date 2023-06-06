import Foundation
import Factory

// This conformance only exists so we can easily switch between Factory and Swinject
extension Factory: Resolver {
    func getInstance() -> T {
        return resolve()
    }
}

