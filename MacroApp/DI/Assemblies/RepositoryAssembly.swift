import Foundation
import Domain
import Data
import JSPlatform
import Swinject

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppRepository.self) { r in
            return AppRepositoryImpl(appService: r.resolve(AppService.self)!)
        }
        container.register(UserRepository.self) { r in
            return UserRepositoryImpl(userService: r.resolve(UserService.self)!)
        }
    }
}
