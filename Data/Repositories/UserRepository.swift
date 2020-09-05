import Foundation
import Domain
import JSPlatform

public struct UserRepository {
    public var getUser = getUser(jsUserService:)
    public var createUser = createUser(jsUserService:)
    public var delete = delete(jsUserService:)
    
    public init() { }
}

private func getUser(jsUserService: JSPlatform.UserService)
    -> (_ id: Int, _ completion: @escaping (Result<User, Error>) -> Void)
    -> Void {
        { id, completion in
            jsUserService.getUser(id) { result in
                let newResult = result.map { $0.asDomain() }
                completion(newResult)
            }
        }
}

private func createUser(jsUserService: JSPlatform.UserService)
    -> (_ name: String, _ password: String, _ completion: @escaping (Result<Domain.User, Error>) -> Void)
    -> Void {
        { name, password, completion in
            let newClosure: (Result<JSPlatform.JSUser, Error>) -> Void = { result in
                let newResult = result.map { jsUser -> Domain.User in
                    jsUser.asDomain()
                }
                completion(newResult)
            }
            return jsUserService.newUser(name, password, newClosure)
        }
}

private func delete(jsUserService: JSPlatform.UserService)
    -> (_ id: Int, _ completion: @escaping (Result<Void, Error>) -> Void)
    -> Void {
        { id, completion in
            jsUserService.deleteUser(id, completion)
        }
}
