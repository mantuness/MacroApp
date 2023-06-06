import Foundation
import Domain
import Data
import JSPlatform
import Swinject

class ClientAssembly: Assembly {
    func assemble(container: Container) {
        container.register(JSClient.self) { r in
            return JSClientImpl()
        }.inObjectScope(.container)
    }
}
