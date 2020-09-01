import Data
import Domain
import Foundation
import JSPlatform

struct GlobalEnvironment {
    var appRepository = AppRepository(jsAppService: JSPlatform.AppService())
}

var Current = GlobalEnvironment()
