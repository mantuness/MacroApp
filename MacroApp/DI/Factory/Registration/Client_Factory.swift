import Foundation
import Domain
import Data
import JSPlatform
import Factory

extension Container {
    var jsClient: Factory<JSClient> {
        Factory(self) {
            print("MARCELO")
            return JSClientImpl()
        }
        .singleton
    }
}
