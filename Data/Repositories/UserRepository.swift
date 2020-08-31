import Foundation
import Domain
import JSPlatform

public struct UserRepository {
    var jsUserService: JSPlatform.UserService
    
    var getUser = getUser(jsUserService:id:completion:)
    var createUser = createUser(jsUserService:name:password:completion:)
    var delete = delete(jsUserService:id:completion:)
    
    public init(jsUserService: JSPlatform.UserService) {
        self.jsUserService = jsUserService
    }
}

extension UserRepository: Domain.UserRepository {
    public func getUser(id: Int, completion: @escaping (Result<User, Error>) -> Void) {
        self.getUser(jsUserService, id, completion)
    }
    
    public func createUser(name: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        self.createUser(jsUserService, name, password, completion)
    }
    
    public func delete(id: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        self.delete(jsUserService, id, completion)
    }
}

extension UserRepository {
    public static var mock = UserRepository(jsUserService: .mock)
}

private func getUser(jsUserService: JSPlatform.UserService, id: Int, completion: @escaping (Result<User, Error>) -> Void) {
    jsUserService.getUser(id) { result in
        let newResult = result.map { $0.asDomain() }
        completion(newResult)
    }
}

private func createUser(jsUserService: JSPlatform.UserService, name: String, password: String, completion: @escaping (Result<Domain.User, Error>) -> Void) {
    let newClosure: (Result<JSPlatform.JSUser, Error>) -> Void = { result in
        let newResult = result.map { jsUser -> Domain.User in
            jsUser.asDomain()
        }
        completion(newResult)
    }
    return jsUserService.newUser(name, password, newClosure)
}

private func delete(jsUserService: JSPlatform.UserService, id: Int, completion: @escaping (Result<Void, Error>) -> Void) {
    return jsUserService.deleteUser(id, completion)
}
