import Foundation
import Domain
import JSPlatform

public final class UserRepositoryImpl: Domain.UserRepository {
    private let userService: JSPlatform.UserService
    public init(userService: JSPlatform.UserService) {
        self.userService = userService
    }
    
    public func getUser(id: Int, completion: @escaping (Result<User, Error>) -> Void) {
        userService.getUser(id: id) { result in
            let newResult = result.map { $0.asDomain() }
            completion(newResult)
        }
    }
    
    public func createUser(name: String, password: String, completion: @escaping (Result<Domain.User, Error>) -> Void) {
        let newClosure: (Result<JSPlatform.JSUser, Error>) -> Void = { result in
            let newResult = result.map { jsUser -> Domain.User in
                jsUser.asDomain()
            }
            completion(newResult)
        }
        userService.newUser(name: name, password: password, completion: newClosure)
    }
    
    public func delete(id: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        userService.deleteUser(id: id, completion: completion)
    }
}
