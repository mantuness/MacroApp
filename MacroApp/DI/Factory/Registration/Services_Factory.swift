import Foundation
import Domain
import Data
import JSPlatform
import Factory

extension Container {
    var userService: Factory<UserService> {
        Factory(self) {
            JSUserService(
                client: self.jsClient.resolve()
            )
        }
    }
    var appService: Factory<AppService> {
        Factory(self) {
            JSAppService(
                client: self.jsClient.resolve()
            )
        }
    }
}
