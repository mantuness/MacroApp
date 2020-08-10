import Foundation
import Domain
import JSPlatform

public final class UserRepositoryImpl: Domain.UserRepository {
    private let userService: JSPlatform.UserService
    init(userService: JSPlatform.UserService) {
        self.userService = userService
    }
    
    public func createUser(name: String, password: String, completion: (Result<Domain.User, Error>) -> Void) {
        let newClosure: (Result<JSPlatform.JSUser, Error>) -> Void = { result in
            let newResult = result.map { jsUser -> Domain.User in
                jsUser.asDomain()
            }
            completion(newResult)
        }
        return userService.newUser(name: name, password: password, completion: newClosure)
    }

    public func delete(id: Int) {
        return userService.deleteUser(id: id)
    }
}
