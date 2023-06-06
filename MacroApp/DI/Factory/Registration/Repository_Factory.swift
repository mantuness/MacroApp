import Foundation
import Domain
import Data
import JSPlatform
import Factory

extension Container {
    var appRepository: Factory<AppRepository> {
        Factory(self) {
            AppRepositoryImpl(
                appService: self.appService.resolve()
            )
        }
    }
    var userRepository: Factory<UserRepository> {
        Factory(self) {
            UserRepositoryImpl(
                userService: self.userService.resolve()
            )
        }
    }
}
