import Foundation

public struct UserRepository {
    var getUser: (_ id: Int, _ completion: @escaping (Result<User, Error>) -> Void) -> Void
    
    var createUser: (_ name: String, _ password: String, _ completion: @escaping (Result<User, Error>) -> Void) -> Void
    
    var delete: (_ id: Int, _ completion: @escaping (Result<Void, Error>) -> Void) -> Void
    
    public init(
        getUser: @escaping (_ id: Int, _ completion: @escaping (Result<User, Error>) -> Void) -> Void,
        createUser: @escaping (_ name: String, _ password: String, _ completion: @escaping (Result<User, Error>) -> Void) -> Void,
        delete: @escaping (_ id: Int, _ completion: @escaping (Result<Void, Error>) -> Void) -> Void
    ) {        
        self.getUser = getUser
        self.createUser = createUser
        self.delete = delete
    }
}
