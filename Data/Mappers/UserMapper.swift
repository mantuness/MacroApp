import Foundation
import Domain
import JSPlatform

extension Domain.User: JSRepresentable {
    func asJS() -> JSPlatform.JSUser {
        JSUser(id: id, name: name)
    }
}

extension JSPlatform.JSUser: DomainConvertibleType {
    func asDomain() -> Domain.User {
        return Domain.User(id: id, name: name)
    }
}
