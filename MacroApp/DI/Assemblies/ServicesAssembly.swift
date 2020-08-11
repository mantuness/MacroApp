import Foundation
import Domain
import Data
import JSPlatform
import Swinject

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UserService.self) { r in
            return JSUserService(client: r.resolve(JSClient.self)!)
        }
        container.register(AppService.self) { r in
            return JSAppService(client: r.resolve(JSClient.self)!)
        }
    }
}
