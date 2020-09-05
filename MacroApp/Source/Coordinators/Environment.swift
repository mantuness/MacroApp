import Data
import Domain
import Foundation
import JSPlatform

struct GlobalEnvironment {
    var appRepository = AppRepository.js()
}

var Current = GlobalEnvironment()


extension Domain.AppRepository {
    static let js: () -> Self = {
        let jsUserService = JSPlatform.AppService()
        
        let repositoryImplementation = AppRepository()
        
        return Domain.AppRepository(
            getConfigs: repositoryImplementation.getConfigs(jsUserService),
            getFeatureFlags: repositoryImplementation.getFeatureFlags(jsUserService),
            getValue: repositoryImplementation.getValue(jsUserService),
            set: repositoryImplementation.set(jsUserService)
        )
    }
}


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
