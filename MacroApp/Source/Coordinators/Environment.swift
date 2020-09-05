import Data
import Domain
import Foundation
import JSPlatform

struct GlobalEnvironment {
    var appRepository = AppRepository(jsAppService: JSPlatform.AppService())
}

var Current = GlobalEnvironment()


extension Domain.UserRepository {
    static let js: () -> Self = {
        let jsUserService = JSPlatform.UserService()
        
        let repositoryImplementation = UserRepository()
        
        return Domain.UserRepository(
            getUser: repositoryImplementation.getUser(jsUserService),
            createUser: repositoryImplementation.createUser(jsUserService),
            delete: repositoryImplementation.delete(jsUserService)
        )
    }
}
